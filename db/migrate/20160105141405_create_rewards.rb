class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
	  	t.references  :job, index: true, foreign_key: true
  	 	t.text        :description
      t.integer     :value
      t.integer     :number_available
      t.date        :estimated_delivery

      t.timestamps null: false
    end
  end
end
