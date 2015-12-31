class Job < ActiveRecord::Base
	
	belongs_to :user

	searchkick
end
