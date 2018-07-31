class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # orders ratings in descending order
  scope :rating_desc, -> { order(rating: :desc) }

  # orders rating in ascending order
  scope :rating_asc, -> { order(rating: :asc) }


end
