require 'spec_helper'

describe "ecomics/new" do
  before(:each) do
    assign(:ecomic, stub_model(Ecomic,
      :name => "MyString",
      :description => "MyString",
      :comic_type => "",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new ecomic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ecomics_path, "post" do
      assert_select "input#ecomic_name[name=?]", "ecomic[name]"
      assert_select "input#ecomic_description[name=?]", "ecomic[description]"
      assert_select "input#ecomic_comic_type[name=?]", "ecomic[comic_type]"
    end
  end
end
