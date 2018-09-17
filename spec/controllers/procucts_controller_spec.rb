require 'rails_helper'

describe ProductsController, type: :controller do
  # let(:pina) { User.create!(email: "pina@colada.com", password: "123456", admin: true) }
  # let(:john) { User.create!(email: "john@doe.com", password: "123456", admin: false)}

  describe 'GET Index' do
    before do
      FactoryBot.create(:product)
      FactoryBot.create(:product, name: "car", price: 22)
    end

    context 'user performes search'
      #Explicitly render views to check if they include the search term
      render_views

      it 'renders only products including the search term' do
        get :index, params: {q: "bike"}
        expect(response).to be_ok
        expect(response.body).to include("bike")
        expect(response.body).to_not include("car")
      end
    

    context 'user performes search'
      #Explicitly render views to check if they include the search term
      render_views

      it 'renders all products' do
        get :index
        expect(response).to be_ok
        expect(response.body).to include("bike")
        expect(response.body).to include("car")
      end
    end
  
  describe 'GET show' do

  context 'when individual product is clicked' do
    before do
      FactoryBot.create(:product, id: 2)
    end

    it 'renders product page' do
       get :show, params: {id: 2}
       expect(response).to be_ok
     end
   end

  describe 'POST create' do

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
end
end