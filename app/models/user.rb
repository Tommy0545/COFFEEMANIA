class User < ApplicationRecord
  def active_for_authentication?
    super && (is_deleted == false)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :beans, dependent: :destroy
  has_many :cafes, dependent: :destroy

  has_many :cafe_comments
  has_many :bean_comments

  has_many :cafe_favorites
  has_many :bean_favorites

  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following


  has_one_attached:profile_image


  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end

  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end


end
