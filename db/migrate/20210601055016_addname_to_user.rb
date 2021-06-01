class AddnameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
  end

  def email_required?
    false
  end

  def password_required?
    false
  end
end
