class AddTodoListIdToTodoItems < ActiveRecord::Migration
  def change
    add_reference :todo_items, :todo_list, index: true, foreign_key: true
  end
end
