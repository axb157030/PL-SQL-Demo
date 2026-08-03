FROM gvenzl/oracle-free:latest

# Copy your bash runner script folder
COPY --chmod=755 ./scripts/ /container-entrypoint-initdb.d/

# Copy your SQL scripts folder into the EXACT same container directory
COPY --chmod=755 ./sql_files/ /container-entrypoint-initdb.d/
