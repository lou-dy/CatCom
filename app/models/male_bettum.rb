class MaleBettum < ApplicationRecord
  has_many :orders
  has_many :comments

  def self.search(search_term)
    if Rails.env.development?
      MaleBettum.where("name LIKE ?", "%#{search_term}%")
    else
      MaleBettum.where("name iLIKE ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end
end
