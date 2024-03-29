source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # rspec testing framework - https://github.com/rspec/rspec-rails/tree/6-0-maintenance
  gem 'rspec-rails', '~> 6.0.0'

  # build factories for testing - https://github.com/thoughtbot/factory_bot_rails 
  gem 'factory_bot_rails'

  # automate tasks on file modification - https://github.com/guard/guard-rspec
  gem 'guard'
  gem 'guard-rspec', require: false

  # generate fake users - https://github.com/faker-ruby/faker
  gem 'faker'
end

group :test do
  # minimise testing spec verbosity https://github.com/thoughtbot/shoulda-matchers
 gem 'shoulda-matchers', '~> 5.0'
  # generate acceptance tests - https://github.com/teamcapybara/capybara
 gem 'capybara'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # add schema to model view - https://github.com/ctran/annotate_models
  gem 'annotate'
  
  # send emails
  gem "letter_opener"

end


gem "cssbundling-rails", "~> 1.1"

gem "jsbundling-rails", "~> 1.1"

gem "sidekiq", "~> 7.0"

gem "devise", "~> 4.9"

gem "pagy", "~> 6.0"
