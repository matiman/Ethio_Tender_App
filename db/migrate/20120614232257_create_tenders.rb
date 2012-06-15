class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.string :title
      t.string :company_name
      t.date :opening_date
      t.date :closing_date
      t.decimal :bid_amount
      t.text :description

      t.timestamps
    end
  end
end
