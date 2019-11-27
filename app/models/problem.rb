class Problem < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { maximum: 50 }
	validates :body, presence: true, length: { maximum: 300 }
	validates :genre, presence: true


	def self.title_search(search)
		if search
			Problem.where(['title LIKE ?', "%#{search}%"])
		else
			Problem.all
		end
	end

	def self.genre_search(search)
		if search
			Problem.where(['genre LIKE ?', "%#{search}%"])
		else
			Problem.all
		end
	end

end
