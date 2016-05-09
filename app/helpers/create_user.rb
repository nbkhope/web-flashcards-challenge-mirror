helpers do

  def create_guest_user
    User.create(username: 'guest' + (User.last.id + 1).to_s, password: '123')
  end
end
