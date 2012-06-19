class Company < ActiveRecord::Base
	attr_accessible :name, :address, :phone_number, :email
	has_many :users, dependent: :destroy #destroy the user when the company is deleted

	#TODO Validation and uniquness of a company
end
