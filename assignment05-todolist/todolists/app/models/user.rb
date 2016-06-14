class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy
	has_many :todo_lists, dependent: :destroy
	has_many :todo_items, through: :todo_lists, source: :todo_items
	validates :username, presence: true

	def get_completed_count
		completed = 0
		todo_items.each do |item|
			if(item.completed)
				completed+=1
			end
		end
		return completed
	end
end
