require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :address => "MyString",
      :phone_number => 1,
      :address => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
      assert_select "input#company_address", :name => "company[address]"
      assert_select "input#company_phone_number", :name => "company[phone_number]"
      assert_select "input#company_address", :name => "company[address]"
      assert_select "input#company_email", :name => "company[email]"
    end
  end
end
