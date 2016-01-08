# == Schema Information
#
# Table name: jobs
#
#  id                :integer          not null, primary key
#  name              :string
#  pay_offer         :string
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  job_status        :integer          default(0), not null
#  expiration_date   :datetime
#  short_description :text
#  description       :text
#  image_url         :string
#

class JobsController < ApplicationController
  before_action :set_jobs, only: [:show, :edit, :update, :destroy]
<<<<<<< HEAD
  before_action :authenticate_user!, except: [:index, :show, :home]
=======
  after_action :reindex, only: [:create, :update, :destroy]

>>>>>>> cc22f4d8021006001d06b92f081062ae9e43609d
  def new

    @new = true
  	@job = current_user.jobs.new
    @job.tasks.new
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
      redirect_to @job, notice: "Job Created"
    end
  end

  def edit
    @new = false
    @job = Job.find(params[:id])
    @bid = @job.bids.first
    @job_skills = JobSkill.all
  end

  def show
<<<<<<< HEAD
    @days_to_go = @job.days_to_go
=======
    @user = @job.user
    @job = Job.find(params[:id])
    @tasks = @job.tasks
>>>>>>> cc22f4d8021006001d06b92f081062ae9e43609d
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
    job_skill = []
    if !params[:required_skills].nil?
      params[:required_skills].each_key do |key|
        job_skill << key
      end
    end 
    @job.required_skills = job_skill
    if @job.update(job_params)
      redirect_to @job, notice: "Job Updated"
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
    @job.tasks.destroy_all
    @job.destroy

    redirect_to jobs_path, notice: "Job Deleted"
  end

  private
  def set_jobs
    @job = Job.friendly.find(params[:id])
  end

  def reindex
    Job.reindex
  end

  def job_params
<<<<<<< HEAD
  	params.require(:job).permit(:name, :pay_offer, :job_status, :expiration_date, :short_description, :description, :image_url)
=======
  	params.require(:job).permit(:name, :pay_offer, :job_status, :required_skills, tasks_attributes: [:id, :name, :status, :_destroy])
>>>>>>> cc22f4d8021006001d06b92f081062ae9e43609d
  end
end
