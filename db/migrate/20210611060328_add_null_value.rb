class AddNullValue < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reviews, :author_id, null: false, index: true
  end
end
