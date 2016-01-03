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
    @skill = Skill.find(params[:skill_id])
    # if !Vote.exists?(:user_id => current_user.id) && @vote.user_id == current_user.id
    #   redirect_to user_path(current_user.id), notice: "U've alraedy voted for this"
    # else
    if @vote.save
      redirect_to :back, notice: "Thank You for your vote on #{@skill.skill}"
    else
      redirect_to :back, notice: "You have voted on #{@skill.skill}"
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
    redirect_to :back, notice: "Vote Destroyed"
  end

  private
  def vote_params
  	params.permit(:up_vote, :down_vote)
  end

  def update_vote_params
    params.permit(:up_vote, :down_vote)
  end
end
