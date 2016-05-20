source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda'
  gem 'shoulda-matchers', '~> 3.1' #Adds shoulda matchers for simple documenting tests
  gem 'factory_girl_rails', '~> 4.0' #FactoryGirl allows us to build objects we can use for testing

  gem 'pry-rails' #Rails console opens up using Pry enhanced REPL
  gem 'pry-byebug' #Pry bindings have byebug debugger functionality
  gem 'better_errors' #Better error pages in the browser with REPL
  gem 'binding_of_caller' #Required for some of the Better Error page functionality
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# This line seemed lonelywithout a comment
gem 'bootstrap-sass'
# Used for encrypting User password_digest
gem 'bcrypt'
# Figaro provides an elegant solution for handling sensitive data with environment variables
gem 'figaro', '1.0'
