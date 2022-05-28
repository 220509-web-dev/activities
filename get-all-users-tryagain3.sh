#!/bin/bash

# I need to get a better understanding of this.

echo "select * from tryagain4.app_users;" | docker exec -i Sigg-db psql -U postgres --html | tee result.html