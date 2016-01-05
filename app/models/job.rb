class Job < ActiveRecord::Base
	belongs_to :user
	has_many :job_skills
	serialize :required_skills
	has_many :bids
	has_many :tasks
	accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

	searchkick

	def has_skill?(skill)
  	return false if required_skills.nil?
	  required_skills.include?(skill) 
  end
end
