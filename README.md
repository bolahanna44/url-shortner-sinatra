## ActiveRecord basics boilerplate

This is a minimalist implementation for url shortner using sinatra + activerecord + rspec

to run: 

```
rake db:create db:migrate
rake
```

for running test suite

```
RACK_ENV=test rake db:create db:migrate
rspec
```
