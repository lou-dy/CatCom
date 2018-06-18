require 'rails_helper'

describe Comment do

  context "validates user, bettum, text comment and rating" do
    let(:comment) {FactoryBot.build(:comment)}

    it "returns valid" do
     expect(comment).to be_valid
    end

  end


  context "not valid without a user" do

    let(:comment) {FactoryBot.build(:comment, user_id: nil)}

    it "returns invalid" do
      expect(comment).not_to be_valid
    end

  end


  context "is invalid without a betta" do

    let(:comment) {FactoryBot.build(:comment, male_bettum_id: nil)}

    it "returns invalid" do
     expect(comment).not_to be_valid
    end

  end


  context "is invalid without a body" do

    let(:comment) {FactoryBot.build(:comment, body: nil)}

    it "returns invalid" do
     expect(comment).not_to be_valid
    end

  end


  context "is invalid without a rating" do

    let(:comment) {FactoryBot.build(:comment, rating: nil)}

    it "returns invalid" do
      expect(comment).not_to be_valid
    end

  end


  context "rating is not an integer" do

    let(:comment) {FactoryBot.build(:comment, rating: "not a number")}

    it "returns invalid" do
      expect(comment).not_to be_valid
    end

  end


end
