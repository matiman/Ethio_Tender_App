require 'spec_helper'

describe "tenders/show" do
  before(:each) do
    @tender = assign(:tender, stub_model(Tender,
      :title => "Title",
      :company_name => "Company Name",
      :bid_amount => "9.99",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Company Name/)
    rendered.should match(/9.99/)
    rendered.should match(/MyText/)
  end
end
