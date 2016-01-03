class Job < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :tag_list, :skills, :skillone, :skill_2, :skill_3, :skill_4, :skill_5
	belongs_to :user

	searchkick
end
