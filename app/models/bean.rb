class Bean < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :bean_comments, dependent: :destroy
  has_many :bean_favorites, dependent: :destroy

  def get_image
    if image.attached?
      image
    end
  end

  def favorited_by?(user)
    bean_favorites.exists?(user_id: user.id)
  end

  enum loast_lebel:{light:0,medium:1,dark:2}

end
