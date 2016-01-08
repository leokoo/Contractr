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
  extend FriendlyId
  friendly_id :uuid
  self.primary_key = 'uuid'
  
	belongs_to :user
	belongs_to :job

	before_validation     :generate_uuid!, :on => :create
	validates_presence_of :delivery_period, :bid_value, :bid_status, :job_id, :user_id

  private

  def generate_uuid!
    begin
      self.uuid = SecureRandom.hex(16)      
    end while Bid.find_by(:uuid => self.uuid).present?
  end

end
