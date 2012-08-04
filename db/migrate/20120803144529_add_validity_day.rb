class AddValidityDay < ActiveRecord::Migration
  def up
	  add_column :tenders, :validity_day, :integer

	   say_with_time "Updating validity day on tenders..." do
	 	 Tender.reset_column_information
		  Tender.all.each do |t|
			  t.update_attribute :validity_day, 30
		  end
	  end
  end

  def down
  end
end
