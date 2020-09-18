require_relative 'boot'

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HealthEdu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.hosts << "healtheducat.rw"
    config.action_mailer.default_url_options = { host: 'healtheducat.rw' }
    config.load_defaults 6.0
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)

    config.action_mailer.delivery_method = :postmark
    #config.hosts << "www.healtheducat.rw"
    config.action_mailer.postmark_settings = {
  api_token: Rails.application.secrets.postmark_api_token
}
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
