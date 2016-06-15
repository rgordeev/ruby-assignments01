class AddtoTodoitemsTololistId < ActiveRecord::Migration
  def change
add_column :todo_items, :todo_list_id, :integer
add_index :todo_items, :todo_list_id
  end
end
