require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project1
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.i18n.default_locale = :vi
    I18n.config.enforce_available_locales = true
    config.i18n.available_locales = [:en, :vi]

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**",
      "*.{rb,yml}")]
    config.time_zone = "Hanoi"
    config.active_record.default_timezone = :local
  end
end
