require 'spec_helper'

describe "eComic pages" do
  
  subject { page }

  describe "New eComic Page" do
    before { visit new_ecomic_path }

    it { should have_content("New ecomic") }
  end


end
