require 'spec_helper'

describe Ecomic do

  before { @ecomic = FactoryGirl.create(:ecomic) }

  subject { @ecomic }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:comic_type) }
  it { should respond_to(:user) }

  describe "without a name" do
    before { @ecomic.name = nil }
    it { should_not be_valid }
  end

  describe "with an already used name" do
    let!(:old_comic) { FactoryGirl.create(:ecomic) }
    before { @ecomic.name = old_comic.name  }
    it { should_not be_valid }
  end

  describe "without a user" do
    before { @ecomic.user = nil }
    it { should_not be_valid }
  end

  describe "with a non existant user id" do
    before { @ecomic.user_id = -1 }
    it { should_not be_valid }
  end

end
