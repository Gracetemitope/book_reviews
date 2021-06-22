class ChangeDataTYpe < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :image_data, :text
  end
end
