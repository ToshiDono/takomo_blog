# README

A simple blog

Running:

* Set the environment variables VOLUMES and ENVPGDATA

Example:

VOLUMES=/Users/user_name/pg_blog

ENVPGDATA=/Users/user_name/pg_data
* docker-compose up -d
* rails db:create && rails db:migrate && rails db:seed
* rails s
