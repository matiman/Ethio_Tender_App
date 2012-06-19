class Tender < ActiveRecord::Base
	#if they are not accessible we can't edit or create unaccessible fields
	attr_accessible :title, :company_name, :category, :opening_date, :closing_date, :bid_amount, :description

	#TODO Associate it with a company object


	#TODO Have a validation to check the amount entered, openning < closing date, and all the informations
	#are provided
	#Add a company or a user id to associate with the tender. I prefer company
end
