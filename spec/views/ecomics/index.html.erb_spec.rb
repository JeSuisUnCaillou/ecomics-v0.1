require 'spec_helper'

describe "ecomics/index" do
  before(:each) do
    assign(:ecomics, [
      stub_model(Ecomic,
        :name => "Name",
        :description => "Description",
        :comic_type => "Comic type",
        :user_id => 1
      ),
      stub_model(Ecomic,
        :name => "Name",
        :description => "Description",
        :comic_type => "Comic type",
        :user_id => 1
      )
    ])
  end

  it "renders a list of ecomics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Comic type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
