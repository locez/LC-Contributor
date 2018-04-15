# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
anonypassword = SecureRandom.urlsafe_base64
anonymous = User.new(name: "anonymous", email: "anonymous@linux.cn",
                 password: anonypassword, password_confirmation: anonypassword)

anonymous.save
anonymous.add_role :anony

%w{新闻 技术 分享 评论}.each do |category|
    c = Category.new(title: category,slug: "")
    c.save
end

