# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name "MyString"
    location "MyString"
    about "MyText"
    manager "MyString"
    phone "MyString"
    email "MyString"
    website "MyString"
  end
end
