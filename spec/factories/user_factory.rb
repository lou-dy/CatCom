FactoryBot.define do
  sequence(:email) { |n| "user#{n}@test.com" }

  factory :user do
    email
    first_name "Jimmy"
    last_name "Doe"
    password "1234567890"
    admin false
  end

  factory :admin, class: User do
    email
    password "qwertyuiop"
    admin true
    role "Admin"
    first_name "Admin"
    last_name "User"
  end
end
