#!/usr/bin/env bash
set -e

echo "=> Running pending migrations..."
bundle exec rails db:migrate

echo "=> Seeding database (if seeds.rb exists)..."
bundle exec rails db:seed || true

echo "=> Starting Puma server..."
exec bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-production}
