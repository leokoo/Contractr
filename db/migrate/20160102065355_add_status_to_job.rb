class AddStatusToJob < ActiveRecord::Migration
  def change
  	add_column :jobs, :job_status, :integer, :null => false, :default => 0
  end
end
