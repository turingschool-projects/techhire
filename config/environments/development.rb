Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  config.paperclip_defaults = {
  :storage => :s3,
  :s3_credentials => {
    :bucket => Figaro.env.whitehousetechhire,
    :access_key_id => Figaro.env.s3_access_key,
    :secret_access_key => Figaro.env.s3_secret_key
  }
}
end
