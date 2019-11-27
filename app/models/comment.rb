class Comment < ApplicationRecord
	belongs_to :problem
	belongs_to :user

	validates :comment, presence:true
	validates :comment, length: {maximum: 300}
end
