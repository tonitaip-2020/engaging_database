# Description

This repository contains a relational database (structure, data) that is engaging for novices.

# Setup with PostgreSQL

The setup with PostgreSQL creates the tables and generates the data.

- Install PostgreSQL. The database has been tested with PostgreSQL 14.2.
- Download the database_generate.sql file.
- Create a database, appropriate users and permission if necessary. Alternatively, you can just use the postgres superuser to test the database.
- Create the database with PostgreSQL's \i command using the psql shell.

`=> \i database_generate.sql`

- If necessary, you may provide an absolute path for \i, e.g.:

`=> \i /home/user/database_generate.sql`

- The following command lists the names of the tables once the database is generated:

`=> \dt`

# Setup with other RDBMSs

TODO: refactor the pg_dump into DBMS agnostic (or specific if impossible) statements.

# Thanks

Artist and song names: https://github.com/fivethirtyeight/data/tree/master/classic-rock