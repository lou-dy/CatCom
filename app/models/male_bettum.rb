class MaleBettum < ApplicationRecord
  has_many :orders

  def self.search(search_term)
    if Rails.env.development?
      MaleBettum.where("name LIKE ?", "%#{search_term}%")
    else
      MaleBettum.where("name iLIKE ?", "%#{search_term}%")
    end
  end
end
