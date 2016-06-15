require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  def create_user(params)
  User.create(:username => params[:username], :password_digest => params[:password_digest])
  end

  def create_todolist(params)
  TodoList.create(:list_name => params[:name], :list_due_date => params[:due_date]) 
  end

  def find_allusers(offset, limit)
  User.limit(limit).offset(offset).order("updated_at asc")
  end

  def find_alllists(offset, limit)
  TodoList.limit(limit).offset(offset).order("list_due_date desc")
  end

  def find_user_byname(username)
 User.all.where("username = ?", username)
  end 

  def find_todolist_byname(name)
  TodoList.all.where("list_name = ?", name)
  end     

  def get_user_byid(id)
  User.find_by id: id
  end

  def get_todolist_byid(id)
  TodoList.find_by id: id
  end

  def update_password(id, password_digest)
  User.update(id, :password_digest => password_digest)
  end

  def update_listname(id, name)
  TodoList.update(id, :list_name => name)
  end 

  def delete_user(id)
  User.delete(id)
  end 

  def delete_todolist(id)
  TodoList.delete(id)
  end
end
