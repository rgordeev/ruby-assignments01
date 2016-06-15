require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  def create_user(params)
  end

  def create_todolist(params)
  end

  def find_allusers(offset, limit)
  end

  def find_alllists(offset, limit)
  end

  def find_user_byname(username)
  end 

  def find_todolist_byname(name)
  end     

  def get_user_byid(id)
  end

  def get_todolist_byid(id)
  end

  def update_password(id, password_digest)
  end

  def update_listname(id, name)
  end 

  def delete_user(id)
  end 

  def delete_todolist(id)
  end
end
