# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    firstname "John"
    lastname "Smyth"
    email "test@exsample.com"
  end
end
