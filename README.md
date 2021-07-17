# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

# Notes:

## Database Creation:

`cafeteria_mgmt_db` created using:

```
sudo -i -u postgres
psql
create database cafeteria_mgmt_db;
\l
\q
```

- `\l` : To view all databases in the system

- `ActiveRecord::Base.connection.tables` : Display all tables in database - run this command in rails console

- The database must exist in local machine to be accessed via `database.yml` file

- Stylesheet ordering: apllication.css using 'require' commands
