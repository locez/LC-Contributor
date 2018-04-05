# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
user = User.new(name: "locez",email: "loki.a@live.cn", 
                 password: "12345678",password_confirmation: "12345678")
user.save
user.add_role :admin
c = Category.new(title: "tech",slug: "")
c.save
c = Category.new(title: "news",slug: "")
c.save
50.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(5)
  user.articles.create!(title: title,content: content,category: c, status: "待投稿")
end
