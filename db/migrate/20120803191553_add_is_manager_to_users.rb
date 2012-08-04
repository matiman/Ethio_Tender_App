class AddIsManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isManager, :boolean , :default => false

     say_with_time "Updating isManager on users..." do
	 	 User.reset_column_information
		 
		  User.all.each do |t|
			  if(t.id%4==0)
		            t.update_attribute :isManager, true
			  else
			  t.update_attribute :isManager, false
			  end
		  end
	  end

    

  end
end
