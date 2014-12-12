require 'spec_helper'

describe "eComic pages" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:ecomic) { FactoryGirl.create(:ecomic, user: user) }
  
  
  subject { page }

  describe "Edit eComic Page" do
    describe "without being logged in" do
      before { visit edit_ecomic_path(ecomic) }
      it { should_not have_content("Editing ecomic") }
      it { should have_content("You need to sign in or sign up before continuing.") }
    end
 
    describe "without being the owner" do
      before do
        sign_in FactoryGirl.create(:user)
        visit edit_ecomic_path(ecomic)
      end
      it { should_not have_content("Editing ecomic") }
      it { should have_content("You're not the owner, you can't do that.") } 
    end

    describe "being the owner" do
      pending("write it")
    end

  end

  describe "New eComic Page" do
    describe "without being logged in" do
      before { visit new_ecomic_path }
      it { should_not have_content("New ecomic") }
      it { should have_content("You need to sign in or sign up before continuing.") }
    end

    describe "being logged in" do
      before do
        sign_in FactoryGirl.create(:user)
        visit new_ecomic_path
      end
      it { should have_content("New ecomic") }
      it { should_not have_content("You need to sign in or sign up before continuing.") }

      describe "filling the new ecomic form" do
        before do
          fill_in "Name", with: "testname"
          fill_in "Description", with: "testdescription"
        end
        it "should let you create an ecomic" do
          expect { click_button "Create Ecomic" }.to change(Ecomic, :count).by(1)
        end
        
        describe "after saving the eComic -> show page" do
          before { click_button "Create Ecomic" }
          it { should have_content("testname") }
          it { should have_content("testdescription") }
        end
      end

    end

  end

  describe "eComics index page" do
    pending("write it") 
  end

end
