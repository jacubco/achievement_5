require 'rails_helper'

describe Order do 

  context "user_id and product_id present" do
    let(:order) { Order.new(user_id: 1, product_id: 12)}
    

    it "returns user_id and product_id" do
      expect(order.user_id).to eq 1
      expect(order.product_id).to eq 12
    end

    it "is not valid without a user_id" do
      expect(Order.new(user_id: "", product_id: 1)).not_to be_valid
    end

    before do
      Product.create!(name: "funny bike")
      User.create!(email: "don@johnson.com", password: "123456")
    end

  end
end