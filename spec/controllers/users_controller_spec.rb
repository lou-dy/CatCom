require 'rails_helper'

describe UsersController, type: :controller do

  let(:user) { User.create!(first_name:"John", last_name:"Doe", email:"johndoe@test.com", password:"123456") }
  let(:user2) { User.create!(first_name:"Jane", last_name:"Who", email:"janewho@test.com", password:"654321") }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end

      it 'validates user' do
        get :show, params: { id: user2.id }
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is not logged in' do
      it 'redirects to log in' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end