class Api::V1::UsersController < ApplicationController

  def create
    if request.content_type != 'application/json'
      render json: {"error" => 'bad content-type'}
    end
    binding.pry
    return if !check_params(params)
  end

  private

  def check_params(params)
    user = params['user']
    user['password'] == user['password_confirmation'] && 
      (user['password'] || user['email']) != nil &&
      !User.find_by(email: user['email'])
  end
end