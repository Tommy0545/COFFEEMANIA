class Cafe < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :cafe_comments, dependent: :destroy
  has_many :cafe_favorites, dependent: :destroy


  def get_image
    if image.attached?
      image
    end
  end

  def favorited_by?(user)
    cafe_favorites.exists?(user_id: user.id)
  end


end
