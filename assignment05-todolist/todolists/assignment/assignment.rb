require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  def create_user(params)
	User.create(params)
  end

  def create_todolist(params)
	TodoList.create(list_name: params[:name], list_due_date: params[:due_date])
  end

  def find_allusers(offset, limit)
	User.unscoped.order(:created_at).limit(limit).offset(offset)
  end

  def find_alllists(offset, limit)
	TodoList.unscoped.limit(limit).offset(offset).order(list_due_date: :desc) 
  end

  def find_user_byname(username)
	User.where(username: username)
  end 

  def find_todolist_byname(name)
	TodoList.where(list_name: name)
  end     

  def get_user_byid(id)
	User.find(id)
  end

  def get_todolist_byid(id)
	TodoList.find(id)
  end

  def update_password(id, password_digest)
	get_user_byid(id).update(password_digest: password_digest)
  end

  def update_listname(id, name)
	get_todolist_byid(id).update(list_name: name)
  end 

  def delete_user(id)
	get_user_byid(id).destroy
  end 

  def delete_todolist(id)
	get_todolist_byid(id).destroy
  end
end
