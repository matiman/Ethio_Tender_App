class Tender < ActiveRecord::Base
	attr_accessible :title, :company_name, :opening_date, :closing_date, :bid_amount, :description
end
