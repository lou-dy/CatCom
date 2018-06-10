require 'rails_helper'

describe MaleBettum do

  context "rating average" do

    let(:male_betta) { MaleBettum.create!(name: "Test fish", price: "15", description: "Fishy") }
    let(:user) { User.create!(first_name:"John", last_name:"Doe", email:"johndoe@test.com", password:"123456")}

    before do
      male_betta.comments.create!(rating: 1, user: user, body: "Awful fish!")
      male_betta.comments.create!(rating: 3, user: user, body: "Ok fish!")
      male_betta.comments.create!(rating: 5, user: user, body: "Great fish!")
    end

    it "returns the average rating of all comments" do
      expect(male_betta.average_rating).to eq 3
    end
  end

  context "betta validation" do
    let(:male_betta) { MaleBettum.new(description: "Nice fish")}

    it "should not be valid" do
      expect(MaleBettum.new(description: "fishy fish")).not_to be_valid
    end
  end

end
