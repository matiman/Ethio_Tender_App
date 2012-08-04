class RenameValidityDateToValidityDay < ActiveRecord::Migration
  def up
	  rename_column :tenders, :validity_date, :validity_days
  
  end

  def down
  end
end
