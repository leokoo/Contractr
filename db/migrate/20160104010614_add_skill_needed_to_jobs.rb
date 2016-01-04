class AddSkillNeededToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :skill_needed, :string
  end
end
