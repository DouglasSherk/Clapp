module HostHelper
  def angularApiPath(path)
    site_host(true) + path
  end

  def site_host(api_request = false)
    case Rails.env
    when 'production', 'phonegap'
      host = 'http://teammatthewminer-clapp.herokuapp.com'
    when 'staging', 'phonegap_staging'
      host = 'http://teammatthewminer-clapp-staging.herokuapp.com'
    when 'development', 'testing'
      host = api_request ? '' : 'http://localhost:3000'
    end
  end
end

