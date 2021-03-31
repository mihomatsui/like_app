class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # user.liked_posts でuserが「いいね！」しているメッセージの値を取得できるようになる
  has_many :liked_posts, through: :likes, source: :post

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now # Confirmableを使用している場合は必要
      # 例えばnameを入力必須としているならば、user.name = "ゲスト"なども必要
    end
   end
end
