class VotesController < ApplicationController
	def new
    @user = User.find(params[:user_id])
    @skill = Skill.find(params[:skill_id])
  	@vote = Vote.new
  end

  def create
  	@vote = Vote.new(vote_params)
  	@vote.user_id = current_user.id
    @vote.skill_id = params[:skill_id]
  	if @vote.save
  		redirect_to user_path(current_user.id)
  	end
  end
  
  def update
    @vote = Vote.find(params[:id])
    @vote.update(update_vote_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def vote_params
  	params.permit(:up_vote, :down_vote)
  end

  def update_vote_params
    params.permit(:up_vote, :down_vote)
  end
end
