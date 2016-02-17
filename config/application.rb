require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pnms
  class Application < Rails::Application
    config.autoload_paths += %W(
      #{config.root}/lib
    )

    config.time_zone = 'Novosibirsk'
    config.i18n.default_locale = :ru
    config.i18n.available_locales = [:ru, :en]
    config.middleware.insert_before 'Rack::Runtime', Rack::UTF8Sanitizer
  end
end
