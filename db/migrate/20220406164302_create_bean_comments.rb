class CreateBeanComments < ActiveRecord::Migration[6.1]
  def change
    create_table :bean_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :bean_id

      t.timestamps
    end
  end
end
