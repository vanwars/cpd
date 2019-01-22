# Dump individual tables:
# Note: make sure Password is set up:
FILE_NAME=chicago_police_sqlite3.sql
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
   pg_dump -U cpdb -w -c --schema-only chicago_police -t $table >> $FILE_NAME
done


FILE_NAME=chicago_police_sqlite3.sql
echo 'Removing unnecessary schema declarations...'
sed -i 's/public\.//g' $FILE_NAME
sed -i '/^SET/ d' $FILE_NAME
sed -i '/^DROP INDEX/ d' $FILE_NAME
sed -i '/^DROP SEQUENCE/ d' $FILE_NAME
sed -i '/^REVOKE/ d' $FILE_NAME
sed -i '/^GRANT/ d' $FILE_NAME
sed -i '/^ALTER/ d' $FILE_NAME
sed -i '/^CREATE INDEX/ d' $FILE_NAME
sed -i '/^CREATE SEQUENCE/ d' $FILE_NAME
sed -i '/^SELECT pg_catalog/ d' $FILE_NAME
sed -i '/^\s*ADD/ d' $FILE_NAME
sed -i '/^\s*START/ d' $FILE_NAME
sed -i '/^\s*INCREMENT/ d' $FILE_NAME
sed -i '/^\s*NO/ d' $FILE_NAME
sed -i '/^\s*CACHE/ d' $FILE_NAME
sed -i '/^\s*--/ d' $FILE_NAME
sed -i 's/geometry(MultiLineString,4326)/character varying(2048)/g' $FILE_NAME
sed -i 's/geometry(Point,4326)/character varying(255)/g' $FILE_NAME
sed -i 's/varying(20)\[\]/varying(511)/g' $FILE_NAME
