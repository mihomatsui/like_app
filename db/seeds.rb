# ログイン時に使用する「メールアドレス」と「パスワード」を定数化して上に配置
EMAIL = "test@example.com"
PASSWORD = "password"

# データを全削除
User.destroy_all
Post.destroy_all

# 以下,開発用の初期データ
user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

# 変数に代入する
post1 = user2.posts.create!(content: "沖縄そば")
post2 = user1.posts.create!(content: "海ぶどう")
post3 = user3.posts.create!(content: "ゴーヤーチャンプルー")
post4 = user3.posts.create!(content: "サーターアンダギー")
post5 = user1.posts.create!(content: "タコライス")

post1.likes.create!(user_id: user1.id)
post1.likes.create!(user_id: user3.id)
post2.likes.create!(user_id: user2.id)
post3.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user2.id)
post5.likes.create!(user_id: user3.id)

# ログイン時に使用するアカウント(変数への代入は不要)
User.create!(email: EMAIL, password: PASSWORD)

puts "初期データの投入に成功しました!"