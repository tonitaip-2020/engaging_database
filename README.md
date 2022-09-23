# Description

This repository contains a relational database (structure, data) that is engaging for novices.

# Setup with PostgreSQL

There are two alternative ways to set up the database with PostgreSQL. You can either generate the data using database_generate.sql or insert the data using database_inserts_postgresql.sql. The main difference between the approaches is that generation both contains some randomization on the values as well as in the number of generated rows, and it generates data that is dynamic (e.g., orders are made up to the time when the database is generated). With inserts, the database is simply a static collection of data.

## Generate the data

- Install PostgreSQL. The database has been tested with PostgreSQL 14.2.
- Download the database_generate.sql file.
- Create a database, appropriate users and permission if necessary. Alternatively, you can just use the postgres superuser to test the database.
- Create the database with PostgreSQL's \i command using the psql shell.

`=> \i database_generate.sql`

- If necessary, you may provide an absolute path for \i, e.g.:

`=> \i /home/user/database_generate.sql`

- The following command lists the names of the tables once the database is generated:

`=> \dt`

## Insert the data

- Install PostgreSQL. The database has been tested with PostgreSQL 14.2.
- Download the database_inserts_postgresql.sql file.
- Create a database, appropriate users and permission if necessary. Alternatively, you can just use the postgres superuser to test the database.
- Create the database with PostgreSQL's \i command using the psql shell.

`=> \i database_inserts_postgresql.sql`

- If necessary, you may provide an absolute path for \i, e.g.:

`=> \i /home/user/database_inserts_postgresql.sql`

- The following command lists the names of the tables once the database is created:

`=> \dt`

# Setup with other RDBMSs

TODO: refactor the pg_dump into DBMS agnostic (or specific if impossible) statements.

# Thanks

Artist and song names: https://github.com/fivethirtyeight/data/tree/master/classic-rock