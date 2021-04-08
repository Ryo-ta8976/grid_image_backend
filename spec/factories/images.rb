FactoryGirl.define do
    factory :image do
        label Faker::App.name
        url Faker::Alphanumeric.alpha(number: 10)
    end
end