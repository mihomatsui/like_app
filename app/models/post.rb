class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # post.liked_usersでpostを「いいね！」しているユーザーの一覧を取得できるようになる
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true

  # post をuser が「いいね!」しているときは「true」,「いいね！」していないときは「false」
  def liked_by?(user)
    likes.find_by(user_id: user.id).present?
  end
end
