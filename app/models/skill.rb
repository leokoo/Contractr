class Skill < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  validates_uniqueness_of :skill, :scope => :user_id
end
