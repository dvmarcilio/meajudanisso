source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.14'
gem 'bootstrap-sass'
gem 'devise'

gem 'omniauth'
gem 'omniauth-facebook','1.4.0'
gem 'omniauth-google-oauth2'

gem 'sass'
gem 'haml'

gem "therubyracer", :require => 'v8'

gem 'tinymce-rails'

gem 'sunspot_rails', github: 'sunspot/sunspot', branch: 'master'
gem 'sunspot_solr', github: 'sunspot/sunspot', branch: 'master'
gem 'punching_bag'
gem 'thumbs_up'

gem 'jquery-rails'
gem 'selenium-webdriver'

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development, :test do
  gem 'sqlite3'
	gem 'database_cleaner', '1.0.1'
	gem 'rspec-rails'
	gem 'cucumber-rails',  :require => false
	gem 'factory_girl_rails'
	gem "shoulda-matchers"
	gem 'annotate', '2.5.0'
end

