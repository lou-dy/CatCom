class Order < ApplicationRecord
  belongs_to :male_bettum, required: false
  belongs_to :user, required: false
end
