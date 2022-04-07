class CreateCafeFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :cafe_favorites do |t|
      t.integer :user_id
      t.integer :cafe_id

      t.timestamps
    end
  end
end
