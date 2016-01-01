class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @job = Job.find(params[:job_id])
    @bid = @job.bids.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  def create
    @job = Job.find(params[:job_id])
    @bid = @job.bids.new(bid_params)
    if @bid.save
      redirect_to @bid
    else
      render :new
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:bid_value)
    end
end
