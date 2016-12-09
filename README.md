# _Salon Dion_

#### _Stores clients and stylists for a hair salon, 12/9/16_

#### By _**Jacob Hixon**_

## Description

_Manage salon Stylists and Clients, add/view/update/delete Clients and Stylists, add/view/update/delete Clients for a particular Stylist_

## Setup
1. _visit https://github.com/jacobhixon47/hair-salon ._
2. _clone into repository_
3. _navigate into the project folder in the terminal_
4. _run $bundle install in the terminal_
5. _run $ruby app.rb in the terminal_
6. _navigate to "localhost:4567" in your web browser_

#### In psql:
* _**run each of these in psql to setup local database**_
1. _'CREATE DATABASE hair_salon;' ._
2. _'\c hair_salon;' ._
3. _'CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, stylist_id int);' ._
4. _'CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);' ._

## Specifications

1. _Returns the name of a stylist_
  * _Example input: Trena_
  * _Expected output: Trena_

2. _Returns the names of a Client_
  * _Example input: (first name)Joe (last name)Barrish_
  * _Expected output: Joe Barrish_

5. _Displays all of these results and options to the user_

## Technologies Used

* _HTML_
* _CSS_
* _Bootstrap_
* _Ruby_
* _Sinatra_
* _Postgres_
* _SQL_

### License

*MIT*

Copyright (c) 2016 **_Jacob Hixon_**
