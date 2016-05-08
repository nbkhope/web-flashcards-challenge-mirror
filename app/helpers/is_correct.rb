helpers do

  def is_correct?
    Card.find_by(id: params[:id]).answer == params[:response]
  end

end
