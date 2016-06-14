class LoginController < ApplicationController
def index
@users = User.all
end

def login_path

end

def log
name = params[:users]
name2 = name[:username].to_s
paswrd = name[:password].to_s
@user = User.find_by username: name2
if @user.nil? == true || paswrd.nil? == true
redirect_to action: :login_path
else
@test = @user.authenticate(paswrd)
if @test == false
redirect_to action: :login_path
else
@list = TodoList.find_by user_id: @user[:id]
end
end
end
end
