class HomesController < ApplicationController
  layout 'login'
  def index
    if current_user != nil
  	  if current_user.profile 
        redirect_to profile_path(current_user)
      else
        redirect_to(new_profile_path(:uid =>current_user.id))
      end
    else
      redirect_to new_user_session_path
    end 	
  end

  def show
    @users = User.all
  end
end


