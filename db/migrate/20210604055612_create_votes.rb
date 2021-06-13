class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :review_id
      t.timestamps
    end
    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :reviews, column: :review_id
  end
end
