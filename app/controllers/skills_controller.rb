class SkillsController < ApplicationController
	def new
    @user = current_user
  	@skill = Skill.new
    @vote = Vote.new
  end

  def create
  	@skill = current_user.skills.new(skill_params)
  	if @skill.save
      @vote = Vote.new(vote_params)
      @vote.user_id = current_user.id
      @vote.skill_id = @skill.id
      @vote.save

  		redirect_to user_path(current_user.id), notice: "Skill Added"
  	end
  end
  
  private
  def skill_params
  	params.require(:skill).permit(:skill)
  end

  def vote_params
    params.permit(:up_vote, :down_vote)
  end
end
