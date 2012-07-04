class Tender < ActiveRecord::Base
	#if they are not accessible we can't edit or create unaccessible fields
       #Here I don't want to create a confusion between company_name and company_id. So I changed the company_name to buyer_name 
	#the id is the company to which this tender belongs to (i.e Bidder)
	attr_accessible :title, :buyer_name, :category, :opening_date, :closing_date, :bid_amount, :description, :status


	#Tender belongs to company but I can use user id as the updater and creater
        belongs_to :company
	validates :company_id, presence: true

	#TODO Associate it with a company object


	#TODO Have a validation to check the amount entered, openning < closing date, and all the informations
	#are provided
	#Add a company or a user id to associate with the tender. I prefer company
	
	def tender_by_company_and_status(status,company_id)
		Tender.where("company_id= ? AND status= ?", company_id, params[:status] )
	end
end
