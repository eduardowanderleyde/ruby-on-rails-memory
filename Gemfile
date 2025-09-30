source "https://rubygems.org"

ruby "3.3.8"

gem "rails", "~> 8.0.0"
gem "puma", "~> 6.0"
gem "pg", "~> 1.1"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "listen"
end

gem "propshaft"

gem "dotenv-rails", "~> 3.1", groups: [:development, :test]
