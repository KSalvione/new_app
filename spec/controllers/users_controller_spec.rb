require 'rails_helper'

describe UsersController, type: :controller do
	before do
		#@user = User.create!(email: "user@user.com", password: "password")
		@user = FactoryGirl.create(:user)
		#@user2 = User.create!(email: "user2@user.com", password: "password")
		@user2 = FactoryGirl.create(:user)
	end

	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in @user
			end

			it 'loads correct user details' do
				get :show, params: { id: @user.id }
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end

		end
	end

		context 'when a user is not logged in' do
			it 'redirects to login' do
				get :show, params: { id: @user.id }
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'User cannot view other user page' do
			before do
				sign_in @user2
			end

			it 'redirects to root path' do
				get :show, params: { id: @user.id }
				expect(response).to redirect_to(root_path)
			end

		end


	
end