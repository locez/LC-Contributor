
# This is a submission system for [Linux.CN](https://linux.cn)

## Ruby version 2.3

## Configuration

### bundle gems

```
 bundle install
```
### edit `db/seeds.rb` to setup your admin user and anonymous user
as default, the second userID is set up for the anonymous user
so you should be careful the order when create admin users and anonymous user

### setup wechat app information

```
vim config/wechat.yml
```

```yml
wechat: &wechat
    # your domain, example: www.example.com or with port www.example.com:8080
    # if empty will auto use your public ip 
    domain: ""
    corpid: "your corpid"
    corpsecret: "your secret"
    #your application number 
    agentid: 1234
    #some users you want to send message, "@all" will send all users,at least one 
    users: "user1|user2|..."
production: *wechat
development: *wechat
```

## Database creation

```
 rails db:migrate:reset
```

## Database initialization

```
 rails db:seed
```

### Run

```
rails server
```

# Todo
 - add password reset
 - modify preview page
