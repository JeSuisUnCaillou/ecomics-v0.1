include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person#{n}@test.com"  }
    sequence(:password) { |n| "#{n}"*8 }
  end


  factory :ecomic do
    sequence(:name) { |n| "eComic #{n}" }
    description "Deeeeeeeeeescription !"
    comic_type "testype"
    user FactoryGirl.create(:user)
  end

  
  factory :frame do
    sequence(:name) { |n| "frame #{n}" }
    duration 0
    ecomic FactoryGirl.create(:ecomic)
    picture { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'mypopcomics-logo.png'), 'image/png') }
  end

end
