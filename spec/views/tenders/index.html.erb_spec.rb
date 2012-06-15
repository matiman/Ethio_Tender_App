require 'spec_helper'

describe "tenders/index" do
  before(:each) do
    assign(:tenders, [
      stub_model(Tender,
        :title => "Title",
        :company_name => "Company Name",
        :bid_amount => "9.99",
        :description => "MyText"
      ),
      stub_model(Tender,
        :title => "Title",
        :company_name => "Company Name",
        :bid_amount => "9.99",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tenders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
