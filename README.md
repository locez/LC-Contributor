
# This is a submission system for [Linux.CN](https://linux.cn)

### Ruby version 2.3

### Configuration

#### 1.bundle gems

```
 bundle install
```
#### 2.edit `db/seeds.rb` to setup your admin user and anonymous user

#### 3.setup wechat app information

```
vim config/wechat.yml
```

```yml
wechat: &wechat
    corpid: "your corpid"
    corpsecret: "your secret"
    #your application number 
    agentid: 1234
    #some users you want to send message,"@all" will send all users,at least one 
    users: "user1|user2|..."
production: *wechat
development: *wechat
```

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

# Todo
 - add password reset
 - modify preview page
