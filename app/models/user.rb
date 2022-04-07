class User < ApplicationRecord
  def active_for_authentication?
    super && (is_deleted == false)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached:profile_image
  has_many :beans, dependent: :destroy
  has_many :cafes, dependent: :destroy
  has_many :cafe_comments, dependent: :destroy
  has_many :bean_comments, dependent: :destroy
  has_many :cafe_favorites, dependent: :destroy
  has_many :bean_favorites, dependent: :destroy

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end


end
