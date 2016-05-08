helpers do

  def create_guest_user
    User.create(username: 'guest', password: '123')
  end
end
