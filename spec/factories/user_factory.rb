FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    first_name "Jimmy"
    last_name "Doe"
    password "1234567890"
    admin false
  end

  # factory :admin, class: User do
  #   email
  #   password "qwertyuiop"
  #   admin true
  #   first_name "Admin"
  #   last_name "User"
  # end
end
