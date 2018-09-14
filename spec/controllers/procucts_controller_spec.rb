require 'rails_helper'

describe ProductsController, type: :controller do
  # let(:pina) { User.create!(email: "pina@colada.com", password: "123456", admin: true) }
  # let(:john) { User.create!(email: "john@doe.com", password: "123456", admin: false)}

  describe 'Product' do
    
    context 'when admin is logged in' do
      before do
        @pina = FactoryBot.build(:user)
        sign_in @pina
      end

      it 'creates a product' do
        expect(FactoryBot.create(:product)).to be_valid
      end
  
  

    # context 'when regular user is logged in' do
    #   before do
    #     @john = FactoryBot.build(:user)
    #     sign_in @john
    #   end

    #   it 'does not create a product' do
    #     expect(Product.create(name: "flying bike")).not_to be_valid
    #   end
    # end


    context 'when a search is performed'
      before do
        Product.create(name: "flying bike")
      end

      it "only shows the race bike" do
        get :index, params: {q: "race bike"}
        expect(response).to be_ok
        expect(Product.index).to eq @product
      end
    end

    context 'when no params come with a search'
      it "only shows the race bike" do
        get :index
        expect(response).to be_ok
      end
    end

end
