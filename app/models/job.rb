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

class Job < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
	belongs_to :user
	has_many :job_skills
	serialize :required_skills
	has_many :bids
  has_many :rewards
  has_many :tasks
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  validates :name, :short_description, :description, :image_url, :expiration_date, presence: true

  before_validation :start_job, :on => :create

	def days_to_go
    (self.expiration_date.to_date - Date.today).to_i
  end

	searchkick

  private
    def start_job
      self.expiration_date = 1.week.from_now
    end

    def slug_candidates
      [
        :name,
        [:name, :created_at]
      ]
    end

	def has_skill?(skill)
  	return false if required_skills.nil?
	  required_skills.include?(skill) 
  	end

  	def completion_status
  		total = self.tasks.count.to_f
  		completed = self.tasks.where("task_status = true").count.to_f
  		completion_percent = ((completed/total)*100).to_f
  		return completion_percent
  	end
end
