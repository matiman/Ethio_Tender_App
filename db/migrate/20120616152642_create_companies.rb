class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.integer :phone_number
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
