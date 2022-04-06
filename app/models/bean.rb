class Bean < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :bean_comment, dependent: :destroy

  def get_image
    if image.attached?
      image
    end
  end

  enum loast_lebel:{light:0,medium:1,dark:2}

end
