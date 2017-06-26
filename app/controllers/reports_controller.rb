class ReportsController < ApplicationController

  def demographics
    @data = Hash.new
    @scope = params[:scope]
    @filter = params[:filter]
    @id = params[:id]

    case @scope
    when "network"
      if @filter
        if @filter == "network"
          @filtered = Network.includes(:sites).find(@id)
          networks = [@filtered]
        else
          @error = "When scoped by network you can only filter by network."
          return
        end
      else
        networks = Network.includes(:sites).all
      end
      populateByScoped(networks)
    when "site"
      if @filter
        case @filter
        when "network"
          sites = Site.includes(:networks).where(:networks => {:id => @id})
          @filtered = Network.find(@id)
        when "site"
          @filtered = Site.find(@id)
          sites = [@filtered]
        else
          @error = "When scoped by site you can only filter by network and site."
          return
        end
      else
        sites = Site.all()
      end
      populateByScoped(sites)
    when "group"
      if @filter
        case @filter
        when "network"
          groups = Group.includes(site: :networks).where(:networks => {:id => @id})
          @filtered = Network.find(@id)
        when "site"
          #Post.where(status: 'published', user: User.where(admin: true)).includes(:user)
          groups = Group.includes(:site).where(site: @id)
          #groups = Group.includes(:site).where(:site => {:id => @id})
          @filtered = Site.find(@id)
          #return
        when "group"
          @filtered = Group.find(@id)
          groups = [@filtered]
        else
          @error = "When scoped by group you can only filter by network, site and group."
          return
        end
        populateByScoped(groups)
      end
    end
  end

  def projects
    @data = Hash.new
    # 🚸 Filter evidence query using filter param
    @evidence = Evidence.includes(:user, :group, :project, :collaborators).all
    @scope = params[:scope]
    @filter = params[:filter]
    @id = params[:id].to_i

    @projects = Project.all
    @project_titles = Hash.new

    @scope_names = Hash.new

    for project in @projects do
      @project_titles[project.id] = []
      @project_titles[project.id][0] = project.title
      if project.curriculas[0]
        @project_titles[project.id][1] = project.curriculas[0].title
      else
        @project_titles[project.id][1] = "-"
      end
    end

    case @filter
    when "network"
      @filtered = Network.find(@id)
    when "site"
      @filtered = Site.find(@id)
    when "group"
      @filtered = Group.includes(:site).find(@id)
    else
    end

    # 🚸 Make this better with queries that take filter into account
    case @scope
    when "network"
      case @filter
      when "network"
        scopes = [Network.find(@id)]
      else
        scopes = Network.all
      end
    when "site"
      case @filter
      when "network"
        scopes = Site.includes(:networks).where(:networks => {:id => @id})
      when "site"
        scopes = [Site.find(@id)]
      else
        scopes = Site.all
      end
    when "group"
      case @filter
      when "network"
        scopes = Group.includes(site: :networks).where(:networks => {:id => @id})
      when "site"
        scopes = Group.includes(:site).where(:site_id => @id)
      when "group"
        scopes = [Group.find(@id)]
      else
        scopes = Group.all
      end
    end

    for s in scopes do
      @data[s.id] = Hash.new
      @scope_names[s.id] = s.name
    end

    def zeroCategories(hash)
      # Submission by anyone
      hash["Evidence Submissions"] = 0
      # Submission by an Educator
      hash["Educator Evidence Submissions"] = 0
      # Submission by an Educator, no Student collaborators
      hash["Educator Only Evidence Submissions"] = 0
      # Submission by a student
      hash["Student Evidence Submissions"] = 0
      # Submission (by a student) or (by an educator with at least one student collaborator)
      hash["Student Associated Evidence Submissions"] = 0
      # Any saved evidence
      hash["Saved Evidence"] = 0
      # Total Evidence submissions + total collaborators
      hash["Total Learning Units"] = 0
      # Total Student Evidence submissions + total Student collaborators
      hash["Student Learning Units"] = 0
      # Total Educator Submissions + total Educator collaborators
      hash["Educator Learning Units"] = 0
    end

    def countEvidence(ev, hash)
      # 🚸 Need to account for deleted evidence
      case ev.status
      when "submitted"
        hash["Evidence Submissions"] += 1
        hash["Total Learning Units"] += 1
        case ev.user.role.name
        when "educator", "general"
          hash["Educator Evidence Submissions"] += 1
          student_assoc = false
          if ev.collaborators
            for c in ev.collaborators do
              hash["Total Learning Units"] += 1
              if c.role.name == "student"
                student_assoc = true
                hash["Student Learning Units"] += 1
              elsif c.role.name == "educator" or "general"
                hash["Educator Learning Units"] += 1
              end
            end
          end
          if student_assoc
            hash["Student Associated Evidence Submissions"] += 1
          else
            hash["Educator Only Evidence Submissions"] += 1
          end
        when "student"
          hash["Student Evidence Submissions"] += 1
          hash["Student Associated Evidence Submissions"] += 1
          if ev.collaborators
            for c in ev.collaborators do
              hash["Total Learning Units"] += 1
              if c.role.name == "student"
                hash["Student Learning Units"] += 1
              elsif c.role.name == "educator" or "general"
                hash["Educator Learning Units"] += 1
              end
            end
          end
        end
      when "saved"
        hash["Saved Evidence"] += 1
      end
    end


    for pr in @projects do
      for s in scopes do
        @data[s.id][pr.id] = Hash.new
        zeroCategories(@data[s.id][pr.id])
      end
    end

    for e in @evidence do
      site = e.group.site
      case @scope
      when "network"
        if site and site.networks
          for n in site.networks
            if @filter == "network"
              if n.id == @id
                countEvidence(e, @data[n.id][e.project_id])
              end
            elsif @filter == "site" or @filter == "group"

              @error = "Cannot filter by site or group with network scope."
              return
            else
              countEvidence(e, @data[n.id][e.project_id])
            end
          end
        end
      when "site"
        if site
          if @filter
            case @filter
            when "network"
              for n in site.networks
                if n.id == @id
                  countEvidence(e, @data[site.id][e.project_id])
                end
              end
            when "site"
              if site.id == @id
                countEvidence(e, @data[site.id][e.project_id])
              end
            end
          else
            countEvidence(e, @data[site.id][e.project_id])
          end
        end
      when "group"
        if site
          if @filter
            case @filter
            when "network"
              for n in site.networks
                if n.id == @id
                  countEvidence(e, @data[e.group.id][e.project_id])
                end
              end
            when "site"
              if site.id == @id
                countEvidence(e, @data[e.group.id][e.project_id])
              end
            when "group"
              if e.group.id == @id
                countEvidence(e, @data[e.group.id][e.project_id])
              end
            end
          else
            countEvidence(e, @data[e.group.id][e.project_id])
          end
        end
      end
    end
  end


  def ethnicity
    if params[:breakdown] == "platform"
      if params[:gender]
        gender = params[:gender]
        selected_users = User.includes(:profile).where("profiles.gender" => gender)
      else
        selected_users = User.all
        gender = "None Selected"
      end
      ethnicities = []
      for i in 0..9 do
        ethnicities[i] = [];
        ethnicities[i][0] = 0;
      end
      count = 0
      for user in selected_users do
        puts count
        profile = Profile.find_by(id: user.id)
        if profile
          puts profile.ethnicity_id
          ethnicity_id = profile.ethnicity_id.to_i
          ethnicities[ethnicity_id][0] += 1;
          count += 1
        end
      end

      for i in 0..9 do
        ethnicities[i][1] = ((ethnicities[i][0]/count.to_f) * 100).round(2)
      end

      puts "Ethnicities"
      puts ethnicities

      @ethnicities = ethnicities
      @gender = gender
    end
  end


  def badges
    @data = Hash.new
    @badges = Badge.includes(:users, :projects).all
    @scope = params[:scope]
    @filter = params[:filter]
    @id = params[:id].to_i
    @badge_names = Hash.new

    @scope_names = Hash.new

    for badge in @badges do
      @badge_names[badge.id] = badge.title
    end

    case @filter
    when "network"
      @filtered = Network.find(@id)
    when "site"
      @filtered = Site.find(@id)
    when "group"
      @filtered = Group.includes(:site).find(@id)
    else
    end

    # 🚸 Make this better with queries that take filter into account
    case @scope
    when "network"
      case @filter
      when "network"
        scopes = [Network.find(@id)]
      else
        scopes = Network.all
      end
    when "site"
      case @filter
      when "network"
        scopes = Site.includes(:networks).where(:networks => {:id => @id})
      when "site"
        scopes = [Site.find(@id)]
      else
        scopes = Site.all
      end
    when "group"
      case @filter
      when "network"
        scopes = Group.includes(site: :networks).where(:networks => {:id => @id})
      when "site"
        scopes = Group.includes(:site).where(:site_id => @id)
      when "group"
        scopes = [Group.find(@id)]
      else
        scopes = Group.all
      end
    end

    for s in scopes do
      @data[s.id] = Hash.new
      @scope_names[s.id] = s.name
    end


    for b in @badges do
      for s in scopes do
        @data[s.id][b.id] = 0;
      end
    end

    for s in scopes do
      for b in @badges do
        for u in b.users do
          account_in_s = false

          case @scope
          when "network", "site"
            badgeUser = User.includes(:profile, :role, :sites).find(u.id)
            for account_site in u.sites do
              case @scope
              when "network"
                for network_site in s.sites do
                  if account_site == network_site
                    account_in_s = true
                    break
                  end
                end
              when "site"
                if account_site == s
                  account_in_s = true
                  break
                end
              end
            end
          when "group"
            badgeUser = User.includes(:profile, :role, :groups).find(u.id)
            for account_grp in u.groups do
              if account_grp == s
                account_in_s = true
              end
            end
          end
          if account_in_s
            @data[s.id][b.id] += 1
          end
        end
      end
    end

    puts @data.inspect


  end

  private

    def countAccount(account, s_hash)
      year = Time.new.year
      s_hash["Accounts"] += 1
      case account.role.name
      when "educator"
        s_hash["Educators"] += 1
      when "student"
        s_hash["Students"] += 1
        case account.profile.gender_id
        when 1
          s_hash["Female"] += 1
        when 2
          s_hash["Male"] += 1
        when 3
          s_hash["Non-Binary/Third Gender"] += 1
        when 4
          s_hash["Prefer to Self-Describe"] += 1
        when 5
          s_hash["Prefer Not to Say"] += 1
        end
        if account.profile.birth_date
          age = year - account.profile.birth_date.year
          case age
          when 0..4
            s_hash["Under 5"] += 1
          when 5..10
            s_hash["5 to 10"] += 1
          when 11..13
            s_hash["11 to 13"] += 1
          when 14..17
            s_hash["14 to 17"] += 1
          when 18..21
            s_hash["18 to 21"] += 1
          when 22..100
            s_hash["Over 21"] += 1
          end
        end
        if account.profile.ethnicity_id
          case account.profile.ethnicity_id
          when 1
            s_hash["American Indian or Alaska Native"] += 1
          when 2
            s_hash["Asian"] += 1
          when 3
            s_hash["Black or African American"] += 1
          when 4
            s_hash["Hispanic, Latino/a, or Spanish origin"] += 1
          when 5
            s_hash["Native Hawaiian or Other Pacific Islander"] += 1
          when 6
            s_hash["White"] += 1
          when 7
            s_hash["Two or More Races"] += 1
          when 8
            s_hash["Decline to Answer"] += 1
          when 9
            s_hash["Middle Eastner or North African"] += 1
          end
        end
      when "general"
        s_hash["General Users"] += 1
      end
    end

    def demographicsHash(scoped)
      for s in scoped do
        @data[s.id] = Hash.new
        s_hash = @data[s.id]
        s_hash["name"] = s.name
        s_hash["id"] = s.id
        if @scope == "site"
          s_hash["Educator Code"] = s.code
        end
        if @scope == "group"
          s_hash["Site Name"] = s.site.name
        end
        s_hash["Accounts"] = 0
        s_hash["Students"] = 0
        s_hash["Educators"] = 0
        s_hash["General Users"] = 0
        s_hash["Female"] = 0
        s_hash["Male"] = 0
        s_hash["Non-Binary/Third Gender"] = 0
        s_hash["Prefer to Self-Describe"] = 0
        s_hash["Prefer Not to Say"] = 0
        s_hash["Evidence Records"] = 0
        s_hash["Evidence Records Saved"] = 0
        s_hash["Evidence Records Submitted"] = 0
        s_hash["Collaborators"] = 0
        s_hash["Under 5"] = 0
        s_hash["5 to 10"] = 0
        s_hash["11 to 13"] = 0
        s_hash["14 to 17"] = 0
        s_hash["18 to 21"] = 0
        s_hash["Over 21"] = 0
        s_hash["American Indian or Alaska Native"] = 0
        s_hash["Asian"] = 0
        s_hash["Black or African American"] = 0
        s_hash["Hispanic, Latino/a, or Spanish origin"] = 0
        s_hash["Native Hawaiian or Other Pacific Islander"] = 0
        s_hash["White"] = 0
        s_hash["Two or More Races"] = 0
        s_hash["Decline to Answer"] = 0
        s_hash["Middle Eastner or North African"] = 0
      end
    end

    def populateByScoped(scoped)
      demographicsHash(scoped)

      case @scope
      when "network", "site"
        accounts = User.includes(:profile, :role, :sites).all
      when "group"
        accounts = User.includes(:profile, :role, :groups).all
      end

      for account in accounts do
        for s in scoped do
          account_in_s = false

          case @scope
          when "network", "site"
            for account_site in account.sites do

              case @scope
              when "network"
                for network_site in s.sites do
                  if account_site == network_site
                    account_in_s = true
                    break
                  end
                end
              when "site"
                if account_site == s
                  account_in_s = true
                end
              end

              if account_in_s
                countAccount(account, @data[s.id])
                break
              end
            end
          when "group"
            for account_grp in account.groups do
              if account_grp == s
                countAccount(account, @data[s.id])
              end
            end
          end

        end
      end

    end

    def countProjects(g)
      for e in @evidence


      end


    end


end
