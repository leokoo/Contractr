class AddFieldsToBid < ActiveRecord::Migration
  def change
  	add_column :bids, :bid_status, :integer
  end
end
