require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lighthousemarfa
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    RouteTranslator.config do |config|
      config.generate_unnamed_unlocalized_routes = true
      config.locale_param_key                    = :locale
    end
    
    config.exceptions_app = self.routes     
    config.action_dispatch.default_headers = { 'X-Frame-Options' => 'ALLOWALL' }

    # We are using Rails ActionMailers in this application
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      domain:               'www.lighthousemarfa.com',
      address:              ENV["SMTPADDRESS"],
      port:                 465,
      user_name:            ENV["SMTPUSERNAME"],
      password:             ENV["SMTPPASSWORD"],
      tls:                  true,
      ssl:                  true,
      authentication:       'login' }

  #  config.action_mailer.default_url_options = { :host => "localhost:3000" }
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    
  end
end
