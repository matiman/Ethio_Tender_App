class AddCompanyIdToTender < ActiveRecord::Migration
def change
    add_column :tenders, :company_id, :integer
	  # after the column is added we need to fill the column 
	  # for the existing rows with the dfault value
	  
	  say_with_time "Updating company id on tenders..." do
	 	 Tender.reset_column_information
		  Tender.all.each do |t|
			  t.update_attribute :company_id, 1
		  end
	  end
  end

  def down
    remove_column :tenders, :company_id
  end

end
