class Api::V1::ApiController < ApplicationController
skip_before_action :authenticate_user!
skip_before_action :verify_authenticity_token
# before_action :current_user



#   def current_user
#     user = User.find_by(authentication_token: request.headers["Authorization"])
#     unless user
#       render json: :unauthorized,status: 403
#     end
#     return user
#   end
end