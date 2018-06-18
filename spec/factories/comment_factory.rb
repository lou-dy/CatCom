FactoryBot.define do
  factory :comment, class: Comment do
    body 'Comment body'
    rating [1, 2, 3, 4, 5].sample
    user
    male_bettum
  end


  factory :invalid_comment, class: Comment do
    body 'Comment body'
    rating 'invalid rating'
    user
    male_bettum
  end
end
