FILE_NAME=chicago_police_sqlite3_1.sql
rm $FILE_NAME

# note: requires .pgpass

# generate schema:
bash _pg2sqlite_schema.sh

# generate insert statements:
bash _pg2sqlite_data.sh
