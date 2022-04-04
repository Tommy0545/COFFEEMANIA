class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :cafe_id
      t.integer :bean_id
      t.string :user_name
      t.datetime :create_date
      t.datetime :update_date

      t.timestamps
    end
  end
end
