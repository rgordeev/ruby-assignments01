class TodoList < ActiveRecord::Base
	has_many :todo_items, dependent: :destroy 
	belongs_to :user
	default_scope {order('list_due_date')}
end
