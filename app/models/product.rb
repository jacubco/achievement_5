class Product < ApplicationRecord
  validates :name, presence: true
  has_many :orders
  has_many :comments

  # Method for search form
  # SQL LIKE operator used to find product if name does not completly match search term
  # ilike is the equivalent operator in POSTGRES (production environment) 
  def self.search(search_term)
    if Rails.env.development? || Rails.env.test?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end

    # finds best rating in comments
    def highest_rating_comment
      comments.rating_desc.first
    end

    # finds worst rating in comments
    def lowest_rating_comment
      comments.rating_asc.first
    end

    def average_rating
      comments.average(:rating).to_f
    end
 
end