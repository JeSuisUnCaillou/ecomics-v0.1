require 'spec_helper'

describe "ecomics/edit" do
  before(:each) do
    @ecomic = assign(:ecomic, stub_model(Ecomic,
      :name => "MyString",
      :description => "MyString",
      :comic_type => "",
      :user_id => 1
    ))
  end

  it "renders the edit ecomic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ecomic_path(@ecomic), "post" do
      assert_select "input#ecomic_name[name=?]", "ecomic[name]"
      assert_select "input#ecomic_description[name=?]", "ecomic[description]"
      assert_select "input#ecomic_comic_type[name=?]", "ecomic[comic_type]"
      assert_select "input#ecomic_user_id[name=?]", "ecomic[user_id]"
    end
  end
end
