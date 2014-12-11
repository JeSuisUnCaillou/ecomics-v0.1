require 'spec_helper'

describe Ecomic do

  before { @ecomic = FactoryGirl.create(:ecomic) }

  subject { @ecomic }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:comic_type) }
  it { should respond_to(:user) }


end
