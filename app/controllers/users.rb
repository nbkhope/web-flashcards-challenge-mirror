get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :'users/new'
  end
end



