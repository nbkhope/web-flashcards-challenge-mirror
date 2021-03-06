get '/login' do
  erb :'/users/login'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  password = params[:user][:password]

  if user && User.authenticate(params[:user][:username], password)
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
  else
    # Failed to authenticate
    @errors = ["Invalid username or password"]
    erb :'users/login'
  end
end

get '/logout' do
  session.clear

  redirect '/'
end
