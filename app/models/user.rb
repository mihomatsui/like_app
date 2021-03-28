class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # user.liked_posts でuserが「いいね！」しているメッセージの値を取得できるようになる
  has_many :liked_posts, through: :likes, source: :post

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
