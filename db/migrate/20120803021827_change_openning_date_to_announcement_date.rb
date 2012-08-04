class ChangeOpenningDateToAnnouncementDate < ActiveRecord::Migration
  def up
	  rename_column :tenders, :opening_date, :announcement_date
  end

  def down
  end
end
