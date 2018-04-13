# README

This is a submission system for [Linux.CN](https://linux.cn)

### Ruby version 2.3

### Configuration

bundle gems

```
 bundle install
```
edit `db/seeds.rb` to setup your admin user and anonymous user


### Database creation

```
 rails db:migrate:reset
```

### Database initialization

```
 rails db:seed
```

### Run

```
rails server
```

* Todo
 - add notification for the admin
 - add password reset
