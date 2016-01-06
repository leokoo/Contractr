class Skill < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates_uniqueness_of :skill, :scope => :user_id
end
