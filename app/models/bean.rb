class Bean < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    if image.attached?
      image
    end
  end

end
