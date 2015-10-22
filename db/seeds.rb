# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Hello World!"
puts "這個種子檔會自動建立一個帳號, 並且創建 20 個 groups, 每個 group 各 30 個 posts"
create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', name: '測試用帳號'])
create_groups = for group_no in 1..20 do
					Group.create!([title: "Group no.#{group_no}", description: "這是測試用種子自動建立的第#{group_no}個討論版", user_id: "1"])
					for post_no in 1..30 do
						Post.create!([group_id: "#{group_no}", content: "這是用種子自動建立的第#{post_no}個留言", user_id: "1"])
					end
				end