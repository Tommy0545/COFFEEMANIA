class CreateBeans < ActiveRecord::Migration[6.1]
  def change
    create_table :beans do |t|

      t.string :image
      t.string :beans_name
      t.string :loast_lebel
      t.string :origin
      t.string :process
      t.text :feedback
      t.string :purchase
      t.datetime :create_date
      t.datetime :update_date

      t.integer :user_id
      t.integer :user_name

      t.timestamps
    end
  end
end
