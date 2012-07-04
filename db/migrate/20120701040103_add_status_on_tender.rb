class AddStatusOnTender < ActiveRecord::Migration
  def up
	  add_column :tenders, :status, :string

	   say_with_time "Updating status on tenders..." do
	 	 Tender.reset_column_information
		  Tender.all.each do |t|
			  t.update_attribute :status, "Initiated"
		  end
	  end
	  
  end

  def down
  	  remove_column :tenders, :status
  end
end
