class Problem < ApplicationRecord
	belongs_to :user
	has_many :pictures
	has_many :comments
end
