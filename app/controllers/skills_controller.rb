class SkillsController < ApplicationController
  def show
    @skill = Skill.find(params[:id])
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
  
  private
  def skill_params
  	params.require(:skill).permit(:skill)
  end
end
