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

class Job < ActiveRecord::Base
	belongs_to :user
	has_many :bids

  before_validation :start_job, :on => :create

	def days_to_go
    (self.expiration_date.to_date - Date.today).to_i
  end

	searchkick

  private
    def start_job
      self.expiration_date = 1.month.from_now
    end
end
