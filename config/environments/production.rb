Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  
  config.force_ssl = true
  config.hosts << ENV["RENDER_EXTERNAL_HOSTNAME"] if ENV["RENDER_EXTERNAL_HOSTNAME"]
  
  config.active_storage.service = :local
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :notify
  config.active_record.dump_schema_after_migration = false
  
  config.log_level = :info
  config.log_tags = [ :request_id ]
  
  config.action_mailer.perform_deliveries = false
  config.action_mailer.raise_delivery_errors = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  
  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
end
