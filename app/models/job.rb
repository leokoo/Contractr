class Job < ActiveRecord::Base
	belongs_to :user
	has_many :job_skills
	serialize :required_skills

	searchkick
end
