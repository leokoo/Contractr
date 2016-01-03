# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  bid_value  :integer
#  user_id    :integer
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bid_status :integer          default(0), not null
#

class Bid < ActiveRecord::Base
	belongs_to :user
	belongs_to :job
end
