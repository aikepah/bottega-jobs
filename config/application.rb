require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BottegaJobs
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.eager_load_paths << "#{Rails.root}/lib"
    # # Autoload lib/ folder including all subdirectories
    # config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.active_job.queue_adapter = :delayed_job

		config.after_initialize do
			ScheduledJob.schedule!
		end

  end
end
