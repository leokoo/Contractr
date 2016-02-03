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
