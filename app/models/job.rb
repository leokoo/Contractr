class Job < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
	belongs_to :user
	has_many :bids
  has_many :rewards

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
end
