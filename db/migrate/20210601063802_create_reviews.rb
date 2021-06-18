class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :author_id
      t.string :title
      t.string :image
      t.text :text
      t.timestamps
    end
    end
  end
