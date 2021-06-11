class Api::V1::SessionController < ApplicationController
  protect_from_forgery :only => [:create]
  skip_before_action :authenticate_user! 
  before_action :load_user, only: :create
  # sign in



  def create
    @user = User.find_by(email: request.headers["email"])
    if @user.valid_password?(request.headers["password"])
     obj = rand_token
     @user.update(authentication_token: obj)
      render json: {
        messages: "Signed In Successfully",
        is_success: true,
        token: obj,
        data: {user: @user}
      }, status: :ok
    else
      render json: {
        messages: "Signed In Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  private

  def load_user
   @user = User.find_by(email: request.headers["email"])
    if @user
      return @user
    else
      render json: {
        messages: "Cannot get User",
        is_success: false,
        data: {}
      }, status: :not_found
    end
  end

  def rand_token
    obj = rand(1000000000000..9999999999999999999999)
  end
end