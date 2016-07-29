class CreateListings < ActiveRecord::Migration
  def change
  	create_table :listings do |t|
  		t.string :name, null: false
  		t.string :location, null: false
  		t.integer :no_of_rooms, null: false

  		t.timestamps
  	end
  end
end
