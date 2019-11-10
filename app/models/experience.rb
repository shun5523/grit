class Experience < ApplicationRecord
	belongs_to :user
	has_many :favorites
	has_many :pictures
end
