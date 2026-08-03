# PL/SQL Demo

-   To create tables, please execute world_building_database_creation.sql first
---
- After table base creation execute world_building_sample_content.sql to build the functions
that return content and the show_values_of_world_building_tables.sql to make the procedure that shows the values of the tables. You may want to build each function and procedure individually
---
- To insert data into the tables, please execute world_building_insertions.sql
---
- To show the values of the table please execute just_show_tables_for_testing.sql
---
- To delete the tables, the functions,  and the procedure, please execute 
world_building_drop_tables_and_functions.sql
---
## Building and Running with Docker

Containerize the application. The name for the container. It does not have to be oracle-plsql-demo.


```bash
docker build -t my-oracle-plsql-demo .
```
---

 Run the application and give it a random password. 

```bash
docker run -d --name oracle-plsql-demo -p 1522:1521 -e ORACLE_RANDOM_PASSWORD=yes my-oracle-plsql-demo
```
---
Please see the logs to see that the SQL files have executed. You will to have to wait for some time. I suspect about .5 to 2 minutes before executing the docker command to see
the SQL files executed.

```bash
docker logs oracle-plsql-demo
```
