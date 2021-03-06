class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def index
    @job = Job.find(params[:job_id])
    @bids = Bid.all
  end

  def show
    #we cannot show :job_id
    # @job = Job.find(params[:job_id])
  end

  def new
    @job = Job.find(params[:job_id])
    @bid = @job.bids.new
    @bid.user_id = current_user.id
  end

  def edit
  end

  def create
    @job = Job.find(params[:job_id])
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
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:bid_value, :bid_status)
    end
end
