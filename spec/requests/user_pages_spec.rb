require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "Sign up page" do

    before { sign_up User.new(name: "a", email: "test@mail.com", password: "a"*8) }
    
    it { should have_content("Welcome! You have signed up successfully.") }
    it { should have_content("Edit profile") }
    it { should have_content("Logout") }

  end

  describe "Sign in page" do
    before { sign_in FactoryGirl.create(:user) }
    it { should have_content("Signed in successfully.") }
    it { should have_content("Edit profile") }
    it { should have_content("Logout") }
  end

end
