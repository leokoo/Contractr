# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  bid_value  :integer
#  user_id    :integer
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bid_status :integer          default(0), not null
#

class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def index
    @bids = Bid.all
  end

  def show
  end

  def new
    @bid = @job.bids.new
    @bid.user_id = current_user.id
  end

  def edit
  end

  def create
    @bid = @job.bids.new(bid_params)
    @bid.user_id = current_user.id
    if @bid.save
      redirect_to @bid
    else
      render :new
    end
  end

  def update
    if @bid.update(bid_params)
      redirect_to @bid
    else
      render :edit
    end
  end

  def destroy
    @bid.destroy
    redirect_to job_bids_path(@bid.job_id)
  end

  private
    def set_bid
      @bid = Bid.find(params[:id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:bid_value, :bid_status, :uuid, :delivery_period)
    end
end
