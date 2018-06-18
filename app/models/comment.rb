class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :male_bettum

  scope :rating_desc, -> { order(rating: :desc) }

  validates :body, presence: true
  validates :user, presence: true
  validates :male_bettum, presence: true
  validates :rating, numericality: { only_integer: true }

  after_create_commit { CommentUpdateJob.perform_later(self, self.user) }

end
