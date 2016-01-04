class AddDefaultValueToVotes < ActiveRecord::Migration
  def change
  	change_column :votes, :up_vote, :integer, default: 0
  	change_column :votes, :down_vote, :integer, default: 0
  end
end
