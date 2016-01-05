class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  validates_uniqueness_of :up_vote, :scope => [:skill_id, :user_id] 
end
