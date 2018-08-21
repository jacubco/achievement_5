require 'rails_helper'

describe UsersController, type: :controller do
  let(:pina) { User.create!(email: "pina@colada.com", password: "123456") }
  let(:john) { User.create!(email: "john@doe.com", password: "123456")}


  describe 'GET #show' do
    context 'when pina is logged in' do
      before do
        sign_in pina
      end

      it 'loads correct user details' do 
        get :show, params: {id: pina.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq pina
      end
    end

    context 'when john is logged in' do
      before do
        sign_in john
      end

      # Do not show details of another user to logged in user
      # Redirect to root
      it 'only show details belonging to logged in user' do
        get :show, params: {id: pina.id }
        expect(response).not_to be_ok
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
        expect(assigns(:user)).to eq pina

      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: {id: john.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end