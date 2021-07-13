Test ingeniosia Symfony Application
========================

Requirements
------------

* PHP 7.4 or higher;
* Make sur Composer is installed  [Get Composer][1]
* Symfony 5 must be installed [Download Symfony][3]
* And the [usual Symfony application requirements][2] are met.
* PDO-MySQL PHP extension enabled;

Installation
------------
Clone or download the project into your local machine.
```bash
$ git clone https://github.com/MiorantsoaRak/ingenosya.git
```

###Install composer dependecies
```bash
$ cd  ingenosya/
$ composer install
```

###Install yarn dependency
```bash
$ yarn install
```

###Compile webpack encore dependencies and scss files
```bash
$ yarn encore dev
```

Database
--------
### Create database
Create a database named `ingenosya` in MySQL and import the SQL file `test-ingenosya.sql` located at
```
./db/test-ingenosya.sql
```
Make sure that the name of the database in the `.env` file is `ingenosya` too.

Usage
-----

To start the server, run this command:

```bash
$ symfony server:start
```

## Project availability

the worker is available in ``http://localhost``but you can change the port of worker in
the ```.env``` file

the adminer is available in ``http://localhost:{$port}``but you can change the port of worker in
the ```.env``` file

[1]: https://getcomposer.org/download
[2]: https://symfony.com/doc/current/reference/requirements.html
[3]: https://symfony.com/download

