class Experience < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true
	validates :body, length: {minimum: 100, maximum: 1000}
	validates :address, presence: true


	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def self.search(search)
		if search
			Experience.where(['title LIKE ?', "%#{search}%"])
		else
			Experience.all
		end
	end
end
