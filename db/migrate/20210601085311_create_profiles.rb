class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
  	
      create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address    	

      t.integer :user_id
      t.timestamps
    end
 
  end
end
