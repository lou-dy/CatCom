FactoryBot.define do
  factory :male_bettum, class: MaleBettum do
    name "New Betta"
    description "Bamboozled! is actually spiky floof"
    image_url "assets/hedgehog.png"
    color "cinnamon"
    tail "cute"
    pattern "algerian"
    price {rand(100...10000)}
  end
end
