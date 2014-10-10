rsf-db
======

Database setup scripts for [Resource Security Framework (RSF)](https://github.com/acciente/rsf)

RSF persists all security relationships in database tables and currently supports several relational database management systems.
This repository contains the SQL DDL scripts that RSF provides to set up the database schema, tables, user and privileges for each supported RDBMS.

The currently supported database systems are:

- IBM DB2 10.5
- Microsoft SQL Server 12.0 (2014)
- Oracle 11g R2
- PostgreSQL 9.3

## Database Setup Scripts
The database setup scripts consist of four different files that should be executed in the following sequence:

1. **create_database.sql**
    + creates a dedicated database for RSF
    + typically run as a DBMS admin user
    + _running this script is optional_ - you could simply create the RSF schema and/or tables within your project's current database
    + _if you are using Oracle, please refer to the RDBMS-specific notes, below_

1. **create_schema.sql**
    + creates a database schema to house RSF-specific tables
    + run this script while connected to the database you set up with the `create_database.sql` script above

1. **create_tables.sql**
    + creates RSF sequences, tables and constraints
    + run this script while connected to the database you set up with the `create_database.sql` script above
    + _Note:_ if you modified (or omitted running) the previous `create_schema.sql` script, you need to update this script to reflect the modified (or lack of) database schema, before running it

1. **create_user.sql**
    + creates a database user for RSF - _**Note:**_ update this script to set the RSF database user's password!
    + grants privileges to connect to the RSF-database you set up with the `create_database.sql` script above
    + grants privileges to the RSF sequences and tables
    + _if you are using IBM DB2, please refer to the RDBMS-specific notes, below_

You are free to modify the provided scripts to suit your project's needs, as far as the database, schema, user and password are concerned - you'll get a chance to apply your customizations to the RSF configuration separately, after the database setup is complete.

There is a fifth script, `drop_tables.sql`, to facilitate removal of RSF constraints, tables and sequences, which you would only run when uninstalling RSF from your project.

### IBM DB2 Database Setup Notes
- create_user.sql
    + DB2 typically uses OS authentication, which means that in DB2 a user has to be created externally to the database first!
    + The `create_user.sql` script assumes a database user by name of `rsfuser` has already been created.
    The script will grant that `rsfuser` privileges to the required RSF database objects.
    + If you wish to use a different database user name, please modify the `create_user.sql` script accordingly.

### Oracle Database Setup Notes
- create_database.sql
    + The Oracle version of this script is provided for completeness' sake, but doesn't actually do anything, because schema/table creation in Oracle sufficiently handles the namespacing of the RSF database objects

## License
RSF and the rsf-db setup scripts are open source software released under the commercial friendly [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

## Documentation
You can find more information about RSF, including the latest Javadocs, releases, and tutorials on the project website:
[resourcesecurityframework.org](http://resourcesecurityframework.org).

## About Acciente
[Acciente, LLC](http://www.acciente.com) is a software company located in Scottsdale, Arizona specializing in systems architecture and software design for medium to large scale software projects.
You can learn more about [Acciente](http://www.acciente.com) on our [about us](http://www.acciente.com/index.php?cid=about) page.
