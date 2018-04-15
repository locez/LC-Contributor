
# This is a submission system for [Linux.CN](https://linux.cn)

## Ruby version 2.3

## Configuration

### bundle gems

```
 bundle install
```

### edit `db/seeds.rb` to setup your anonymous user
if you want to set up one user as admin, you can:

```
rails console
user = User.find_by(:mail => "your email")
user.add_role :admin
```

### setup application information

```
vim config/application.yml
```

```yml
github: &github
    GITHUB_KEY: "1234567890"
    GITHUB_SECRET: "example"
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
production: 
    <<: *wechat
    <<: *github
development: 
    <<: *wechat
    <<: *github
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
 - add root, about and contact page
