get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
  	# Failed to create new user
  	@errors = @user.errors.full_messages
    erb :'users/new'
  end
end



