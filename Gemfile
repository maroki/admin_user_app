source 'https://rubygems.org'
ruby '2.3.0'

# Rails
gem 'rails', '~> 5.0.3'

# Database
gem 'pg', '~> 0.19.0'

# App server
gem 'puma', '~> 3.0'

# Frontend
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.3.1'
gem 'turbolinks', '~> 5'
gem 'slim-rails', '~> 3.1.1'
gem 'simple_form', '~> 3.4.0'

# JSON API
gem 'jbuilder', '~> 2.5'

# Pagination
gem 'kaminari', '~> 0.17.0'

# Authentication
gem 'devise', '~> 4.2.0'

# User pictures
gem 'paperclip', "~> 5.0.0"

# PDF Statistics
gem 'prawn', '~> 1.3.0'
gem 'prawn-table', '~> 0.2.0'

group :development, :test do
  # Debug
  gem 'jazz_fingers', '~> 4.0.1'

  # Tests
  gem 'rspec-rails'
  gem 'guard-rspec', '~> 4.2.10', require: false

  # Fake data generator
  gem 'faker', '~> 1.6.6'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors', '~>1.1.0'
  gem 'pry'
  gem 'letter_opener'
end

group :test do
  gem 'database_cleaner', '~> 1.5.3'
  gem 'factory_girl_rails', '~> 4.7.0'
  gem 'shoulda-matchers', '~> 3.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
