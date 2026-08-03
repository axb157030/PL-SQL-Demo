#!/bin/bash
echo "=================================================="
echo "LAUNCHING DATABASE INITIALIZATION SCRIPTS"
echo "=================================================="
sqlplus / as sysdba <<EOF
SET SERVEROUTPUT ON SIZE UNLIMITED;
@/container-entrypoint-initdb.d/world_building_database_creation.sql
@/container-entrypoint-initdb.d/world_building_sample_content.sql
@/container-entrypoint-initdb.d/show_values_of_world_building_tables.sql
@/container-entrypoint-initdb.d/world_building_insertions.sql
@/container-entrypoint-initdb.d/show_tables_for_testing.sql
exit;
EOF
echo "Database initialization and insertion finished!"