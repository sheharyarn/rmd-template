require File.expand_path('../boot', __FILE__)

# require 'rails/all'
# require "active_resource/railtie"
# require "sprockets/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module RmdTemplate
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.assets.initialize_on_precompile = false
    # config.autoload_paths += %W(#{config.root}/extras)
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    # config.time_zone = 'Central Time (US & Canada)'
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # config.active_record.schema_format = :sql
    # config.active_record.whitelist_attributes = true
  end
end
