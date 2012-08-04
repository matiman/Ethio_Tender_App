class FillValidityDayData < ActiveRecord::Migration
  def up
	  remove_column :tenders, :validity_day
	  
  end

  def down
  end
end
