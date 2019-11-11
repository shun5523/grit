class Experience < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :pictures, dependent: :destroy
end
