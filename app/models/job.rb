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
  before_action :authenticate_user!, except: [:index, :show]
	
	belongs_to :user
	has_many :bids

	searchkick
end
