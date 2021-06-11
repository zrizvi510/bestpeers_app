class PicturesController < ApplicationController
  layout 'login'
  def new
    @user = User.find(params[:uid])
    @picture = Picture.new
  end
  
  def show
    @picture = Picture.find(params[:id]) 
  end

  def create
    @user = User.find(params[:uid])
    @picture = @user.build_picture(picture_params)
    @user.picture.save
    flash[:success] = "Picture added successfully"
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @picture = @user.picture.update(picture_params)
    flash[:success] = "Picture Updated successfully"
    redirect_to root_path
  end

  private
  def picture_params
    params.require(:picture).permit(:image)
  end
end