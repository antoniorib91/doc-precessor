# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.6.4

* Rails version 6.0.0

Install ruby 2.6.4 and rails 6.0.0.

clone the repo

run console command:
bundle install

run console command:
rails s #to run server

run console command:
whenever --update-crontab --set environment=development #to start cron task

the cron task run every 1 minute verifyng
the files.dat inside the HOMEPATH/data/in folder

the cron logs are inside log folder

runs on port 3000.
