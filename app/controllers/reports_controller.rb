class ReportsController < ApplicationController

  def accounts
    @breakdown = params[:breakdown]
    @scope = params[:scope]
    case @breakdown
    when "platform"
      selected_users = User.includes(:profile, :role, :sites).all
    when "site"
      if @scope
        selected_users = User.includes(:profile, :role, :sites)
        @sites = Site.where( "id" => @scope)
      else
        selected_users = User.includes(:profile, :role, :sites).all
        @sites = Site.all
      end

      sites_data = Hash.new
      for site in @sites do
        sites_data[site.id] = Hash.new
        site_hash = sites_data[site.id]
        site_hash["name"] = site.name
        site_hash["id"] = site.id
        site_hash["Educator Code"] = site.code
        site_hash["Accounts"] = 0
        site_hash["Students"] = 0
        site_hash["Educators"] = 0
        site_hash["General Users"] = 0
        site_hash["Girls"] = 0
        site_hash["Boys"] = 0
        site_hash["Other Gender"] = 0
        site_hash["Evidence Records"] = 0
        site_hash["Evidence Records Saved"] = 0
        site_hash["Evidence Records Submitted"] = 0
        site_hash["Collaborators"] = 0
      end

      for user in selected_users do
        #if user.id % 70 == 0
          for site in user.sites do
            if sites_data[site.id]
              site_hash = sites_data[site.id]
              site_hash["Accounts"] += 1
              case user.role.name
              when "educator"
                site_hash["Educators"] += 1
              when "student"
                site_hash["Students"] += 1
                case user.profile.gender
                when "female"
                  site_hash["Girls"] += 1
                when "male"
                  site_hash["Boys"] += 1
                else
                  site_hash["Other Gender"] += 1
                end
              when "general"
                site_hash["General Users"] += 1
              else
              end
            end
          #end
        end
        for evidence in user.evidence do
          site = evidence.group.site
          if site
            site_hash = sites_data[site.id]
            site_hash["Evidence Records"] += 1
            if evidence.status == "saved"
              site_hash["Evidence Records Saved"] += 1
            elsif evidence.status == "submitted"
              site_hash["Evidence Records Submitted"] += 1
            else
            end

            if evidence.status == "submitted"
              site_hash["Collaborators"] += 1
              for collaboration in evidence.collaborations do
                site_hash["Collaborators"] += 1
              end
            end
          end
        end
      end

      @data = sites_data

    else
      selected_users = User.includes(:profile).all

    end
    #@data = "data"
  end

  def projects
    @breakdown = params[:breakdown]
    @scope = params[:scope]


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




end
