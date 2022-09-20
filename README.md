# Description

This repository contains a relational database (structure, data) that is engaging for novices.

# Setup with PostgreSQL

- Install PostgreSQL. The database has been tested with PostgreSQL 14.2.
- Download the database.sql file.
- Create a database, appropriate users and permission if necessary. Alternatively, you can just use the postgres superuser to test the database.
- Create the database with PostgreSQL's \i command using the psql shell.

`=> \i database.sql`

- The following command lists the names of the tables:

`=> \dt`