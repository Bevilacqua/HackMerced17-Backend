Apipie.configure do |config|
  config.app_name                = "Hack Merced 17"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/docs"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.copyright               = "Study Space, Inc. 2017"
  config.app_info                = "API for HackMerced17. Endpoints are for analyzing sites and determining if the source is reliable."
end
