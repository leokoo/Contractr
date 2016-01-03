class JobsController < ApplicationController
  def new
    @job = Job.new
    # @skills = Job.first.skill_list
  end

  def create
    @job = current_user.jobs.new(job_params)
    # @skills = Job.first.skill_list
      # if @job.skill_list == ["1"]
      #   @job.skill_list = @skills
      # else
      #   @job.skill_list == nil
      # end
    if @job.save
      Job.reindex
      redirect_to jobs_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    Job.reindex

    redirect_to jobs_path
  end

  def index
    query = params[:q].presence || "*"
    @jobs = Job.search(query).to_a.flatten.uniq
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    Job.reindex

    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:name, :pay_offer, :skill1, :skill2, :skill3, :skill4, :skill5)
  end
end
