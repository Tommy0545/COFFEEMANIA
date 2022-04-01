class CreateCaves < ActiveRecord::Migration[6.1]
  def change
    create_table :caves do |t|

      t.string :image
      t.string :store_name
      t.string :location
      t.text :introduction
      t.text :site_url
      t.datetime :create_date
      t.datetime :update_date

      t.integer :user_id
      t.integer :user_name
      t.timestamps
    end
  end
end
