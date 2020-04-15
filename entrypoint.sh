#!/bin/bash
set -euo pipefail

# Applying desidered PUID to user Nobody
sed -i 's/:1000:100:/:'$PUID':100:/g' /etc/passwd

# Unset compiled variables for PHP
unset PHP_MD5 PHP_INI_DIR GPG_KEYS PHP_LDFLAGS PHP_SHA256 \
      PHPIZE_DEPS PHP_URL PHP_EXTRA_CONFIGURE_ARGS SHLVL \
      PHP_CFLAGS PHP_ASC_URL PHP_CPPFLAGS SUPERVISOR_ENABLED \
      SUPERVISOR_PROCESS_NAME SUPERVISOR_GROUP_NAME
# Unset user variables
unset PUID TZ
exec "$@"
