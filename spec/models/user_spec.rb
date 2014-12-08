require 'spec_helper'

describe User do

  before { @user = FactoryGirl.create(:user) } 

  subject { @user }

  it { should be_valid }
  it { should respond_to(:name) }

  describe "without a username" do
    before { @user.name = nil }
    it { should_not be_valid }
  end

  describe "with an already used username" do
    let!(:old_user) { FactoryGirl.create(:user) }
    before do
      @user.name = old_user.name
    end
    it { should_not be_valid }
  end

end
