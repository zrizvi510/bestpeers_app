class AddDobColumnProfile < ActiveRecord::Migration[6.1]
  def change
  	add_column :profiles, :date_of_birth, :date
  end
end
