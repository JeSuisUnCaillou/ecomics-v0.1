require 'spec_helper'

describe "ecomics/show" do
  before(:each) do
    @ecomic = assign(:ecomic, stub_model(Ecomic,
      :name => "Name",
      :description => "Description",
      :comic_type => "Comic type",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Comic type/)
    rendered.should match(/1/)
  end
end
