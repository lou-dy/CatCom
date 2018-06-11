FactoryBot.define do
  factory :user do
    first_name "Jimmy"
    last_name "Doe"
    email "jdoe@test.com"
    password "1234567890"
    admin false
  end
end
