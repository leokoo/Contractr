class AddDefaultValueToStatus < ActiveRecord::Migration
  def change
  	change_column :tasks, :status, :boolean, :default => false
  end
end
