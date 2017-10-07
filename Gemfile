source 'https://rubygems.org'

ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'rails_utils'
gem 'puma', '~> 3.0'
gem 'popper_js'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Gems that provided features unique to this project
gem 'bootstrap', '~> 4.0.0.beta'
gem 'font-awesome-sass', '~> 4.5.0'
gem 'high_voltage', '~> 3.0.0'
gem 'simple_form'
gem 'devise'
# gem 'bootsy', :git => "https://github.com/volmer/bootsy.git", :branch => "bootstrap-4"
gem 'summernote-rails', :git => "https://github.com/felixtriller/summernote-rails.git", :branch => "master"
gem 'commontator', :git => "https://github.com/lml/commontator.git", :branch => "rails5"
gem 'groupify'
gem 'twitter-typeahead-rails'
gem 'bootstrap_tokenfield_rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
