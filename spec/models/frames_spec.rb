require 'spec_helper'

describe Frame do
  before { @frame = FactoryGirl.create(:frame) } 
  
  subject { @frame }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:duration) }
  it { should respond_to(:ecomic) }


  describe "without a name" do
    before { @frame.name = nil }
    it { should_not be_valid }
  end

  describe "with an already used name" do
    let!(:old_frame) { FactoryGirl.create(:frame) }
    before { @frame.name = old_frame.name  }
    it { should_not be_valid }
  end


  describe "without an eComic" do
    before { @frame.ecomic = nil }
    it { should_not be_valid }
  end

  describe "with a non existant eComic id" do
    before { @frame.ecomic_id = -1 }
    it { should_not be_valid }
  end

end
