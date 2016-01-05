# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  name            :string
#  pay_offer       :string
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  job_status      :integer          default(0), not null
#  expiration_date :datetime
#

class JobsController < ApplicationController
  before_action :set_jobs, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :home]
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
    @days_to_go = @job.days_to_go
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

  def home
    @jobs = Job.all
    @displayed_jobs = @jobs.last(1)
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
  	params.require(:job).permit(:name, :pay_offer, :job_status, :expiration_date, :short_description, :description, :image_url)
  end
end
