json.array!(@logins) do |login|
  json.extract! login, :id, :username, :password
  json.url login_url(login, format: :json)
end
