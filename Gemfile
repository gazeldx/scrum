source 'https://rubygems.org'
# source 'http://ruby.taobao.org/'

gem 'carrierwave', '0.6.2'
gem 'friendly_id'
gem 'jquery-rails'
gem 'mini_magick', '~> 3.3'
gem 'nested_form'
gem 'newrelic_rpm'
gem 'pg'
gem 'rails', '3.2.11'
gem 'rails_kindeditor', '~> 0.4.0'
gem 'sass-rails',   '~> 3.2.3'# Sass adapter for the Rails asset pipeline.
gem 'settingslogic'
gem 'slim'
gem 'will_paginate'


group :assets do
  gem 'coffee-rails', '~> 3.2.1'# Coffee Script adapter for the Rails asset pipeline.
  gem 'uglifier', '>= 1.0.3'# Ruby wrapper for UglifyJS JavaScript compressor
end

platform :ruby do # linux
  gem 'libv8', '~> 3.11.8'
  gem 'therubyracer'
end

platform :mswin, :mingw do # windows
  gem 'execjs'
end

group :deploy do
  gem 'unicorn'
  gem 'puma'
end