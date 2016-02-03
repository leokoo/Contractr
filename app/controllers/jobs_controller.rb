class JobsController < ApplicationController
  before_action :set_jobs, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :home]

  def new
    @job = Job.new
    @job_skills = JobSkill.all
  end

  def create
  	@job = current_user.jobs.new(job_params)

    job_skill = []
    if !params[:required_skills].nil?
      params[:required_skills].each_key do |key|
        job_skill << key
      end
    end 
    @job.required_skills = job_skill
    if @job.save

      Job.reindex
      redirect_to jobs_path, notice: "Job Created"
    end
  end

  def edit
    @job_skills = JobSkill.all
  end

  def show
    @days_to_go = @job.days_to_go
  end

  def update
    job_skill = []
    if !params[:required_skills].nil?
      params[:required_skills].each_key do |key|
        job_skill << key
      end
    end 
    @job.required_skills = job_skill
    if @job.update(job_params)

      Job.reindex
      redirect_to jobs_path, notice: "Job Updated"
    end
  end

  def index
  	query = params[:q].presence || "*"
  	@jobs = Job.search(query).to_a.flatten.uniq
  end

  def home
    @jobs = Job.all
    @displayed_jobs = Job.take(4)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    Job.reindex
    redirect_to jobs_path
  end

  private
  def set_jobs
    @job = Job.friendly.find(params[:id])
  end

  def job_params
  	params.require(:job).permit(:name, :pay_offer, :job_status, :expiration_date, :short_description, :description, :image_url, :required_skills)
  end
end
