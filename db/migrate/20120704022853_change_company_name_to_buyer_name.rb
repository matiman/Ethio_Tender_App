class ChangeCompanyNameToBuyerName < ActiveRecord::Migration
  def up
	  rename_column :tenders, :company_name, :buyer_name
  end

  def down
  end
end
