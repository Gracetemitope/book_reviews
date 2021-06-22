class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :image, :image_data
  end
end
