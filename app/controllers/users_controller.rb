class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]

  def show
  end

  private
	def set_users
		@user = User.find(params[:id])
	end
end