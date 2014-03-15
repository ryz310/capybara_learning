# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone do
    contact
    phone "090-1234-5678"
    phone_type "home"
  end
end
