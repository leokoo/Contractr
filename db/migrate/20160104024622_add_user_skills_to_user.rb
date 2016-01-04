class AddUserSkillsToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_skills, :string
  end
end
