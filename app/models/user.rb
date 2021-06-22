class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30, case_sensitive: false }

  has_many :reviews, foreign_key: :author_id, dependent: :destroy
  has_many :votes, dependent: :destroy

  def email_required?
    false
  end

  def password_required?
    false
  end
end
