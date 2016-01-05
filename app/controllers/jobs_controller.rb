class JobsController < ApplicationController
  before_action :set_jobs, only: [:show, :edit, :update, :destroy]
  after_action :reindex, only: [:create, :update, :destroy]
  def new
    @new = true
  	@job = Job.new
    @job.tasks.new
  end

  def create
  	@job = current_user.jobs.new(job_params)

  	if @job.save
  		redirect_to @job
  	end
  end

  def edit
    @new = false
    @job = Job.find(params[:id])
    @bid = @job.bids.first
  end

  def show
    @job = Job.find(params[:id])
    @tasks = @job.tasks
  end

  def update
    @job = Job.find(params[:id])
  	@job.update(job_params)

    params[:job][:tasks_attributes].each do |x,y|
      
      if y[:task_status] == "1"
        task = Task.find(y[:id])
        task.update(:task_status => true)
      else
        task = Task.find(y[:id])
        task.update(:task_status => false)
      end
    end

    Job.reindex

    redirect_to jobs_path
  end

  def index
  	query = params[:q].presence || "*"
  	@jobs = Job.search(query).to_a.flatten.uniq
  end

  def destroy
  	@job.destroy

    redirect_to jobs_path
  end

  private
  def set_jobs
    @job = Job.find(params[:id])
  end

  def reindex
    Job.reindex
  end

  def job_params
  	params.require(:job).permit(:name, :pay_offer, :job_status, tasks_attributes: [:id, :name, :status, :_destroy])
  end
end
