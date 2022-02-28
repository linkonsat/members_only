class User < ApplicationRecord
  validate do |user|
    errors.add :email, :not_unique, message: "This email has already been taken. Select another"
    errors.add :user_name, :not_unique, message: "This username has already been taken. Please select another."
  end
  validates :email, uniqueness: true
  validates :user_name, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
end
