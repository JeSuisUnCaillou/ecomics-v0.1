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
    duration 50
    ecomic FactoryGirl.create(:ecomic)
  end

end
