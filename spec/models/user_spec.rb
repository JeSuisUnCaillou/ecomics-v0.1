require 'spec_helper'

describe User do

  before { @user = FactoryGirl.create(:user) } 

  subject { @user }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:ecomics) }

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

  describe "has many ecomics" do
    let!(:ec1) { FactoryGirl.create(:ecomic, user: @user) }
    let!(:ec2) { FactoryGirl.create(:ecomic, user: @user) }
    let!(:ec3) { FactoryGirl.create(:ecomic, user: @user) }

    its(:ecomics) { should eq [ec1, ec2, ec3] }
  end
end
