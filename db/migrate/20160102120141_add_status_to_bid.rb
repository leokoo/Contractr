class AddStatusToBid < ActiveRecord::Migration
  def change
  	add_column :bids, :status, :integer, :null => false, :default => 0
  end
end
