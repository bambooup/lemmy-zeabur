#!/bin/sh
set -e

cat > /config/config.hjson <<EOF
{
  hostname: "${LEMMY_HOSTNAME}"
  bind: "0.0.0.0"
  port: 8536

  database: {
    host: "${POSTGRES_HOST}"
    port: ${POSTGRES_PORT}
    user: "${POSTGRES_USER}"
    password: "${POSTGRES_PASSWORD}"
    database: "${POSTGRES_DATABASE}"
    pool_size: 5
  }

  pictrs: {
    url: "${PICTRS_URL}"
  }

  setup: {
    admin_username: "${LEMMY_ADMIN_USERNAME}"
    admin_password: "${LEMMY_ADMIN_PASSWORD}"
    site_name: "${LEMMY_SITE_NAME}"
    admin_email: "${LEMMY_ADMIN_EMAIL}"
  }
}
EOF

exec lemmy_server
