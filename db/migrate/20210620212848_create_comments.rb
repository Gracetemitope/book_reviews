class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :review_id
      t.text :content

      t.timestamps
    end
    add_index :comments, :review_id
    add_foreign_key :comments, :users, column: :user_id
  end
end
