class AddValidityDateOnTender < ActiveRecord::Migration
   def up
	  add_column :tenders, :validity_date, :integer
  end

  def down
  end
end 
