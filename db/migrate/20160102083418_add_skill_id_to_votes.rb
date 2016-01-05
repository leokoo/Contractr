class AddSkillIdToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :skill, index: true, foreign_key: true
  end
end
