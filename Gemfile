source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.1"
gem "mysql2"
gem "bcrypt"
gem "bootstrap-sass", "3.2.0.0"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "cancancan"
gem "devise"
gem "carrierwave", "0.11.2"
gem "carrierwave-base64"
gem "mini_magick", "4.5.1"
gem "cloudinary"
gem "koala"
gem "httparty"
gem "sdoc", "~> 0.4.0", group: :doc
gem "active_model_serializers", "~> 0.8.0"
gem "config"
gem "bluecloth"
gem "fcm"
gem "figaro"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg", "0.17.1"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
