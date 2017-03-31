class ReportsController < ApplicationController

  def index
    @breakdown = params[:breakdown]
    @scope = params[:scope]
    case @breakdown
    when "platform"
      selected_users = User.includes(:profile).all
    when "site"
      if @scope
        selected_users = User.includes(:profile)
        @sites = Site.where( "id" => @scope)
      else
        selected_users = User.includes(:profile).all
        @sites = Site.all
      end

      sites_data = Hash.new
      for site in @sites do
        sites_data[site.id] = Hash.new
        sites_data[site.id]["name"] = site.name
        sites_data[site.id]["id"] = site.id
        sites_data[site.id]["EdCode"] = site.code
        sites_data[site.id]["UserCount"] = 0
      end

      for user in selected_users do
          site_users = SiteUser.where('user' => user.id)
          for site in site_users do
            puts "****"
            puts site.inspect
            puts "****"
            if sites_data[site.site_id]
              sites_data[site.site_id]["UserCount"] += 1
            end
        end
      end

      @data = sites_data

    else
      selected_users = User.includes(:profile).all

    end
    #@data = "data"
  end

  def accounts
    if params
      @users = User.includes(:profile).where("profiles.ethnicity_id" => params[:ethnicity].to_i)
    else
      @users = User.all
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




end
