# config/initializers/fog.rb

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',                     # Required
    :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],  # Required
    :aws_secret_access_key => ENV['AWS_ACCESS_KEY_SECRET'] # Required
    #:region                => ENV['AWS_S3_REGION'] 
  }

  config.fog_directory  =  ENV['AWS_S3_BUCKET_NAME']  # Required
  config.fog_public     = true                        # optional, defaults to true
  config.cache_dir      = "#{Rails.root}/tmp/uploads" # For Heroku
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  config.fog_use_ssl_for_aws = false
end