RMD Template
============

This is just basic Rails Template I made for myself. Rails 4, Mongoid 4, Devise and Unicorn pre-configured. Ready to push to Heroku. `mongoid.yml` is configured to use with Heroku's MongoHQ Addon.

Just do a mass-search-and-replace for **RmdTemplate** with whatever your app name is, and you're good to go.

There might have been better ways do this, but I'm just too lazy to search for / learn them. 


Steps to follow:
----------------

Clone the app

```
$ git clone https://github.com/sheharyarn/rmd-template
$ cd rmd-template
```

Enter these commands to push and test your basic Rails app on Heroku

```
$ heroku create
$ heroku addons:add mongohq:sandbox
$ heroku labs:enable user-env-compile
$ git push heroku master
```