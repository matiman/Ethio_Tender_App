require 'spec_helper'

describe "tenders/edit" do
  before(:each) do
    @tender = assign(:tender, stub_model(Tender,
      :title => "MyString",
      :company_name => "MyString",
      :bid_amount => "9.99",
      :description => "MyText"
    ))
  end

  it "renders the edit tender form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tenders_path(@tender), :method => "post" do
      assert_select "input#tender_title", :name => "tender[title]"
      assert_select "input#tender_company_name", :name => "tender[company_name]"
      assert_select "input#tender_bid_amount", :name => "tender[bid_amount]"
      assert_select "textarea#tender_description", :name => "tender[description]"
    end
  end
end
