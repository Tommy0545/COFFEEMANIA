class Cafe < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :cafe_comments, dependent: :destroy


  def get_image
    if image.attached?
      image
    end
  end
  
  
end
