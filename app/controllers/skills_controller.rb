class SkillsController < ApplicationController
  layout 'login'
  def new
    @skill = Skill.new 
  end
  
  def show
    @skill = Skill.find(params[:id]) 
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:success] = "successfully create"
      redirect_to @skill
    else
      render :new
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end