# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
admin = User.new(name: "locez",email: "loki.a@live.cn", 
                 password: "12345678", password_confirmation: "12345678")
admin.save
admin.add_role :admin
anonymous = User.new(name: "anonymous",email: "anonymous@linux.cn",
                 password: "11111111", password_confirmation: "11111111")
anonymous.save
%w{新闻 技术 分享 评论}.each do |category|
    c = Category.new(title: category,slug: "")
    c.save
end
c = Category.find 1
50.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(5)
  anonymous.articles.create!(title: title,content: content,category: c, status: "待投稿")
end
