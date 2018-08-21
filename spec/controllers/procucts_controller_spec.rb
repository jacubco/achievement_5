require 'rails_helper'

describe ProductsController, type: :controller do
  let(:pina) { User.create!(email: "pina@colada.com", password: "123456", admin: true) }
  let(:john) { User.create!(email: "john@doe.com", password: "123456", admin: false)}


  describe 'Product' do
    context 'when admin is logged in' do
      before do
        sign_in pina
      end

      it 'creates a product' do
        expect(Product.create(name: "flying bike")).to be_valid
      end
    end

    # context 'when regular user is logged in' do
    #   before do
    #     sign_in john
    #   end

    #   it 'does not create a product' do
    #     expect(Product.create(name: "flying bike")).not_to be_valid
    #   end
    # end
  end

end
