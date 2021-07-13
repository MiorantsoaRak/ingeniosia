Test ingeniosia Symfony Application
========================

Requirements
------------

* PHP 7.4 or higher;
* PDO-MySQL PHP extension enabled;
* and the [usual Symfony application requirements][2].

Installation
------------

[Download Symfony][4] to install the `symfony` binary on your computer, pull or download the source code and install dependancy

```bash
$ cd  ingeniosia-test/
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
```
php bin/console doctrine:database:create
```
Usage
-----
- Configure your environnement file .env (Database, MailDSN, ...)


If you have [installed Symfony][4] binary, run this command:

```bash
$ cd  test-ingeniosia/
$ symfony server:start
```

## Project availability

the worker is available in ``http://localhost``but you can change the port of worker in
the ```.env``` file

the adminer is available in ``http://localhost:{$port}``but you can change the port of worker in
the ```.env``` file

