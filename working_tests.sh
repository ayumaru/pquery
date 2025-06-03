#!/bin/bash
docker compose up -d --build
docker run --rm -it pquery-php php -d error_reporting=E_ALL -d display_errors=1 ./vendor/bin/phpunit --display-deprecations --display-notices --display-warnings ./tests/
# echo "When you are young"
