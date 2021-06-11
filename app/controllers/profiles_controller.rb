class ProfilesController < ApplicationController
  layout 'login'
  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.find(params[:uid])
    @profile = @user.build_profile
  end

  def create
    @user = User.find(params[:uid])
    @profile = @user.build_profile(profile_params)
    if @user.profile.save
      flash[:success] = "successfully created"
      redirect_to new_picture_path(:uid =>@user.id)
    else
      flash[:success] = "some error occured"
      render :new
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:uid])
    if @user.profile.update(profile_params)
      flash[:success] = "Updated successfully"
      redirect_to profile_path(@user) 
    else
      render 'edit'
    end
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :address, :date_of_birth, :skill_ids => [])
  end
end
