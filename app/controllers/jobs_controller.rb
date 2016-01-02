class JobsController < ApplicationController
  before_action :set_jobs, only: [:show, :edit, :update, :destroy]
  def new
  	@job = Job.new
  end

  def create
  	@job = current_user.jobs.new(job_params)

  	if @job.save
  		Job.reindex
  		redirect_to jobs_path
  	end
  end

  def edit
  end

  def show
  end

  def update
  	@job.update(job_params)
    Job.reindex

    redirect_to jobs_path
  end

  def index
  	query = params[:q].presence || "*"
  	@jobs = Job.search(query).to_a.flatten.uniq
  end

  def destroy
  	@job.destroy
    Job.reindex

    redirect_to jobs_path
  end

  private
  def set_jobs
    @job = Job.find(params[:id])
  end

  def job_params
  	params.require(:job).permit(:name, :pay_offer, :status)
  end
end
