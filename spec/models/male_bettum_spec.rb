require 'rails_helper'

describe MaleBettum do

  context "rating average" do

    let(:male_betta) { MaleBettum.create!(name: "Test fish", price: "15", description: "Fishy") }
    let(:user) { FactoryBot.create(:user) }

    before do
      male_betta.comments.create!(rating: 1, user: user, body: "Awful fish!")
      male_betta.comments.create!(rating: 3, user: user, body: "Ok fish!")
      male_betta.comments.create!(rating: 5, user: user, body: "Great fish!")
    end

    it "returns the average rating of all comments" do
      expect(male_betta.average_rating).to eq 3
    end
  end

  context "bettas with complete information" do
    let(:male_bettum) {FactoryBot.build(:male_bettum)}

    it "should be valid" do
      expect(male_bettum).to be_valid
    end
  end

  context "bettas with no names" do
    let(:male_bettum) {FactoryBot.build(:male_bettum, name: nil)}

    it "should not be valid" do
      expect(male_bettum).not_to be_valid
    end
  end

  context "bettas with no description" do
    let(:male_bettum) {FactoryBot.build(:male_bettum, description: nil)}

    it "should not be valid" do
      expect(male_bettum).not_to be_valid
    end
  end

  context "bettas with no price" do
    let(:male_bettum) {FactoryBot.build(:male_bettum, price: nil)}

    it "should not be valid" do
      expect(male_bettum).not_to be_valid
    end
  end

end
