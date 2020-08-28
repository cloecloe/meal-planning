class User < ApplicationRecord
  belongs_to :calendar
  has_many :favorites, dependent: :destroy
  has_many :recipes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
