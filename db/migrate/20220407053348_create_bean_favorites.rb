class CreateBeanFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :bean_favorites do |t|
      t.integer :user_id
      t.integer :bean_id

      t.timestamps
    end
  end
end
