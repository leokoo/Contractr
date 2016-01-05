class JobSkillsController < ApplicationController
	def new
		@job_skill = JobSkill.new
	end

	def create
		@job_skill = JobSkill.new(job_skill_params)
		if @job_skill.save
			redirect_to root_path
		end
	end

	private
	def job_skill_params
		params.require(:job_skill).permit(:skill)
	end
end
