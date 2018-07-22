class Product < ApplicationRecord
  has_many :orders

  # Method for search form
  # SQL LIKE operator used to find product if name does not completly match search term
  # ilike is the equivalent operator in POSTGRES (production environment) 
  def self.search(search_term)
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end
end