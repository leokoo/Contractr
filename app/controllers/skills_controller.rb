class SkillsController < ApplicationController
  before_action :set_skills, only: [:show, :destroy]

  def show
  end

	def new
    @user = current_user
  	@skill = Skill.new
    @vote = Vote.new
  end

  def create
  	@skill = Skill.new(skill_params)
  	if @skill.save

  		redirect_to user_path(current_user.id), notice: "Skill Added"
  	end
  end
  
  def destroy
    @skill.destroy

    redirect_to user_path(current_user), notice: "Skill Deleted"
  end

  private
  def set_skills
    @skill = Skill.find(params[:id])
  end

  def skill_params
  	params.require(:skill).permit(:skill)
  end
end
