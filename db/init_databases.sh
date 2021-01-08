#!/bin/bash
echo "";
echo "";
echo "CREATE DATABASES 'applandql_development'";
psql -c "CREATE DATABASE applandql_development";
echo "";
echo "CREATE DATABASES 'applandql_testing'";
psql -c "CREATE DATABASE applandql_testing";
echo "";