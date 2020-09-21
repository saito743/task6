class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  attachment :profile_image, destroy: false

  has_many :follower,claas_name:"Relationship",foreign:"follower_id",dependent: :destroy
  has_many :followed,claas_name:"Relationship",foreign:"followed_id",dependent: :destroy
  has_many :following_user, thougth: :follower,source: :folowed
  has_many :follow_user, thougth: :followed,source: :folower

  def following?(user)
    following_user.include?(user)
  end

  def follow(user_id)
    follower.create(follow_id: user_id)
  end

  def unfollow(user_id)
    followed.find_by(follow_id: user_id).destroy
  end

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 50 }
end
