class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :male_bettum

  scope :rating_desc, -> { order(rating: :desc) }
end
