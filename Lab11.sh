#11.a

#Start MySQL on PWD
docker run --name mysql-test -e MYSQL_ROOT_PASSWORD=root -d -p 3306:3306 mysql

#Enter MySQL CLI
docker exec -it mysql-test mysql -uroot -proot

#Run SQL Commands (directly in terminal)
CREATE DATABASE testdb;
USE testdb;
CREATE TABLE users (
id VARCHAR(10) PRIMARY KEY,
name VARCHAR(50),
age INT
);

#Now Insert The values :
INSERT INTO users VALUES ('u001', 'Alice', 30);
INSERT INTO users VALUES ('u002', 'Bob', 25);

#Now Display the table contents:
SELECT * FROM users;

#11.b

#Start PostgreSQL
docker run --name pg-test -e POSTGRES_PASSWORD=root -d -p 5432:5432 postgres

#Enter PostgreSQL CLI
docker exec -it pg-test psql -U postgres

#Run SQL Commands
CREATE TABLE users (
id TEXT PRIMARY KEY,
name TEXT,
age INT
);

#Now Insert the values:
INSERT INTO users VALUES ('P01', 'Ganesh', 30);
INSERT INTO users VALUES ('P02', 'Suresh', 40);

#Now, Display the table contents:
SELECT * FROM users;
