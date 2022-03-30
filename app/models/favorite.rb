class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :cafe
  belongs_to :bean

end
