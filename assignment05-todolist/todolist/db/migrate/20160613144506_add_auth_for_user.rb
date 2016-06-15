class AddAuthForUser < ActiveRecord::Migration
  def change
remove_column :users, :authenticate, :string
  end
end
