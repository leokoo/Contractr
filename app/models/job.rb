class Job < ActiveRecord::Base
	belongs_to :user
	has_many :job_skills
	serialize :required_skills
	has_many :bids

	searchkick
end
