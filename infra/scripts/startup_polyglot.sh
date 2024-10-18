#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Execute a db migrate only when ENVIRONMENT var is set (only on AWS)
# if [ -z ${ENVIRONMENT+x} ]; then
#     bundle exec rake db:migrate
# fi

# Execute db migrate only on staging and prod
# if [ "${ENVIRONMENT}" == "staging" ] || [ "${ENVIRONMENT}" == "prod" ]; then
bundle exec rake db:migrate
# fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
