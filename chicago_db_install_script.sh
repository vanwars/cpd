############################
# load postgreSQL database #
############################


DB_NAME=chicago_police
USER=cpdb
DB_PASS=123
gunzip < cpdb.sql.gz | psql $DB_NAME -U $USER


# notebook
# numeracy

# Drop database:
psql -c "DROP DATABASE $DB_NAME;" -U postgres

# Create database:
psql -c "CREATE DATABASE $DB_NAME;" -U postgres
psql -c "CREATE USER $USER WITH PASSWORD '$DB_PASS';" -U postgres
psql -c "GRANT ALL ON DATABASE $DB_NAME TO $USER;" -U postgres

# Create users / roles:
# psql -c "ALTER ROLE $USER SET client_encoding TO 'utf8';" -U postgres
# psql -c "ALTER ROLE $USER SET default_transaction_isolation TO 'read committed';" -U postgres
# psql -c "ALTER ROLE $USER SET timezone TO 'UTC';" -U postgres
psql -c "ALTER ROLE $USER SUPERUSER;" -U postgres
# brew services restart postgresql

# Install extensions:
psql -c "CREATE EXTENSION postgis;" -d $DB_NAME -U postgres
psql -c "CREATE EXTENSION postgis_topology;" -d $DB_NAME -U postgres
# brew services restart postgresql

# connect to chicago_police database
# psql -U cpdb -d chicago_police
