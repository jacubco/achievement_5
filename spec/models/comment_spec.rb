require 'rails_helper'

describe Comment do 

  context "when product and user exist" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "john@smith.com", password: "123456")}

    before do
      User.create!(email: "john@smith.com", password: "123456")
    end

    it "is not valid without a rating" do
      expect(product.comments.new(product_id: 1, user_id: 1, rating: 3, body: "Nice bike!")).to be_valid
    end
  end
end