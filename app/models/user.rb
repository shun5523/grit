class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  has_many :visits
  has_many :countries, through: :visits
  has_many :comments
  has_many :problems, dependent: :destroy
  has_many :experiences
  has_many :favorites, dependent: :destroy



end
