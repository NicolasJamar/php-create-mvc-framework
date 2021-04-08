# DEV env: docker-compose

You have now installed Docker on your computer. Congratulations ! 🥳 Now we will present you your home made environment. 

But firstly, if you are completely new to Docker we recommend you to read the [Docker Survival Guide](https://github.com/becodeorg/cli/tree/develop/docs/docker-survival-guide).


## The environement is here !

Have a look at this folder. You have 2 files and 1 folder :
- docker-compose.yml
- Dockerfile
- src

The `docker-compose.yml` and `Dockerfile` are the configurations file in order to run your containers. 

The `src` folder is your work environment folder where you will code your PHP files. There is already a `index.php` in it. 

For working, you can paste the folder `03-docker-environment` in your computer, rename it as you want and follow the instructions below. 


## Run `docker`

When starting your env for the first time, run the following command in your repo:

	docker-compose build
	
> **NOTE:** thus you don't need to run this command each time, it may be useful to *re*build your services when you change the configuration of your services.

Then, simply run the following command to get started:

    docker-compose up

The details for all your services is detailed bellow.

## Your services

### Langage: PHP

#### What is PHP?

PHP is a server-side scripting language designed for web development, but which can also be used as a general-purpose programming language. PHP can be added to straight HTML or it can be used with a variety of templating engines and web frameworks. PHP code is usually processed by an interpreter, which is either implemented as a native module on the web-server or as a common gateway interface (CGI).

* **Website:** [php.net](http://php.net)
* **Documentation:** [php.net/docs.php](http://php.net/docs.php)

#### Container

* **Image used:** [library/php:apache](https://hub.docker.com/_/php/)

##### Usage

Place your PHP files in `./src` folder, access it with your browser at address [localhost](http://localhost).


* * *

### Database: MariaDB

#### What is MariaDB?

MariaDB is a community-developed fork of MySQL intended to remain free under the GNU GPL.

* **Website:** [mariadb.org](https://mariadb.org)
* **Documentation:** [mariadb.org/learn](https://mariadb.org/learn/)

#### Container

* **Image used:** [library/mariadb](https://hub.docker.com/_/mariadb/)

##### Usage

> **NOTE:** from dev POV, using MariaDB is strictly the same as using MySQL.

**IMPORTANT:** the first startup of this container is long : the db server needs to be initialized.

**NOTE:** the container don't create a database at startup - create it within your code (or with phpMyAdmin)

###### Access from another container

You can access the database **from another container** with the following informations:

* **host:** `mysql`
* **port:** `3306`
* **user:** `root`
* **pass:** `root`

###### Access from your host

You can access the database  **from you host** with the following informations:

* **host:** `localhost`
* **port:** `3306`
* **user:** `root`
* **pass:** `root`


* * *

### Tools: phpMyAdmin

#### What is phpMyAdmin?

A web interface for MySQL and MariaDB.

* **Website:** [phpmyadmin.net](https://www.phpmyadmin.net/)
* **Documentation:** [phpmyadmin.net/docs](https://www.phpmyadmin.net/docs/)

#### Container

* **Image used:** [phpmyadmin/phpmyadmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin/)

##### Usage

The container is already configured to use the MySQL/MariaDB credentials.  
Access **phpMyAdmin** with your browser at address [localhost:8001](http://localhost:8001).
