class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]

  def show
  	
  end

  private
	def set_users
		@user = User.find(params[:id])
	end


	def vote
		unless skill.user_id == current_user.id
				unless current_user.votes.exists?(skill.votes) 
					ink_to("Like", user_skill_votes_path(current_user, skill, :up_vote => 1.to_i), :method => :post)
				end 
				skill.votes.each do |vote|
					if vote.user_id == current_user.id 
						link_to("Unlike", user_skill_vote_path(current_user, skill, vote), :method => :delete)
				end	
			end
		end
		 link_to Vote.where("skill_id = #{skill.id}", "up_vote = 1").count, user_skill_path(@user, skill)
	end

end