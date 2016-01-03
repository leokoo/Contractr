class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :up_vote
      t.integer :down_vote
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
