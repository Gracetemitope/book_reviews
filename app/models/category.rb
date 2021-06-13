class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # validates :priority, presence: true, uniqueness: true

  has_many :reviews, dependent: :destroy
end
