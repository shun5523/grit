class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image

  has_many :visits
  has_many :countries, through: :visits
  has_many :comments
  has_many :problems, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # accepts_nested_attributes_for :visits, allow_destroy: true

  validates :name, presence: true, length: { in: 2..20 }
  validates :age, presence: true
  validates :sex, presence: true
  validates :introduction, length: { maximum: 200}
end
