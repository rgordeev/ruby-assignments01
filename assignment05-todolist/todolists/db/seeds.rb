# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
	 {:username => "Fiorina", :password_digest => "password1"},
	 {:username => "Trump", :password_digest => "password2"},
	 {:username => "Carson", :password_digest => "password3"},
	 {:username => "Clinton", :password_digest => "password4"}])

	users[0].create_profile(:first_name => "Carly",:last_name => "Fiorina", :gender => "female", :birth_year => 1954, :photo => "photo1")
	users[1].create_profile(:first_name => "Donald", :last_name => "Trump", :gender => "male", :birth_year => 1946, :photo => "photo2")
	users[2].create_profile(:first_name => "Ben", :last_name => "Carson", :gender => "male", :birth_year => 1951, :photo => "photo3")
	users[3].create_profile(:first_name => "Hillary", :last_name => "Clinton", :gender => "female",:birth_year => 1947, :photo => "photo4")
	due_date = Date.today
	todolists =
	[
	 users[0].todo_lists.create(:list_due_date => due_date),
	 users[1].todo_lists.create(:list_due_date => due_date),
	 users[2].todo_lists.create(:list_due_date => due_date),
	 users[3].todo_lists.create(:list_due_date => due_date)
	]
	todolists.each do |list|
	 for i in 0...5
	 list.todo_items.create(:due_date => due_date)
	 end
	end