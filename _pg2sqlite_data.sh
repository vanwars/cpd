# https://manuelvanrijn.nl/blog/2012/01/18/convert-postgresql-to-sqlite/

# SQLITE3 NOTES:
# .tables  -- lists tables

# LIST OF TABLES


# Dump individual tables:
# Note: make sure Password is set up:
FILE_NAME=chicago_police_sqlite3.sql
# rm $FILE_NAME

tables=(
    data_attachmentfile
    data_attachmentrequest
    data_award
    data_complainant
    data_investigator
    data_investigatorallegation
    data_involvement
    data_linearea
    data_officer
    data_officeralias
    data_officerallegation
    data_officerbadgenumber
    data_officerhistory
    data_pipeline_appliedfixture
    data_policeunit
    data_policewitness
    data_racepopulation
    data_salary
    data_versioning_changelog
    data_victim
    # spatial_ref_sys
    trr_actionresponse
    trr_charge
    trr_subjectweapon
    trr_trr
    trr_trrattachmentrequest
    trr_trrstatus
    trr_weapondischarge
    # layer
    # topology
)
for table in "${tables[@]}"
do
   :
   echo 'Dumping '$table'...'
   pg_dump -U cpdb -w --inserts --data-only chicago_police -t $table >> $FILE_NAME
done


echo 'Cleaning data...'
sed -i 's/ true/ \x27t\x27/g' $FILE_NAME
sed -i 's/ false/ \x27f\x27/g' $FILE_NAME
