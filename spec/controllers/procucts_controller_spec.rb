require 'rails_helper'

describe ProductsController, type: :controller do
  # let(:pina) { User.create!(email: "pina@colada.com", password: "123456", admin: true) }
  # let(:john) { User.create!(email: "john@doe.com", password: "123456", admin: false)}

  describe 'Product' do
    
    # Create action
    context 'when admin is logged in' do
      before do
        @user = FactoryBot.create(:admin)
        sign_in @user
      end

      # both 'creates article' tests do the same
      # leaving them for personal reference
      it "creates article" do 
        article_params = FactoryBot.attributes_for(:product)
        expect { post :create, params: {product: article_params} }.to change(Product, :count).by(1) 
      end

      it "creates article" do 
        expect{ post :create, params: {product: FactoryBot.attributes_for(:product)} 
        }.to change(Product,:count).by(1)
      end
    end

    context 'when regular user is logged in' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      # both tests do the same
      # leaving them for personal reference
      it "does not create an article" do 
        article_params = FactoryBot.attributes_for(:product)
        expect { post :create, params: {product: article_params} }.to change(Product, :count).by(0) 
      end
    end
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


    # context 'when a search is performed'
    #   before do
    #     Product.create(name: "flying bike")
    #   end

    #   it "only shows the race bike" do
    #     get :index, params: {q: "race bike"}
    #     expect(response).to be_ok
    #     expect(Product.index).to eq @product
    #   end
    # end

    # context 'when no params come with a search'
    #   it "only shows the race bike" do
    #     get :index
    #     expect(response).to be_ok
    #   end
    # end

end
