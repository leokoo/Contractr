class Job < ActiveRecord::Base
	
	has_many :users, through :bids
	has_many :bids

	searchkick
end
