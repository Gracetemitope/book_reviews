class AddCatIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :category, foreign_key: true

  end
end
