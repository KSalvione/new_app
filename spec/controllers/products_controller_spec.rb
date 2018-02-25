require 'rails_helper'

	describe ProductsController, type: :controller do

		before do
			@user = FactoryGirl.create(:user)
			@admin = FactoryGirl.create(:user, admin: true)
			@product1 = FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", colour: "red", price: "100")
			@product2 = FactoryGirl.create(:product, name: "Blue Blade", description: "Blue Blade", colour: "blue", price: "100")
			@product3 = FactoryGirl.create(:product, name: "White Blade", description: "White Blade", colour: "white", price: "100")
			@product4 = FactoryGirl.create(:product, name: "Pink Blade", description: "Pink Blade", colour: "pink", price: "100")
		end

		describe 'GET #index' do
			context 'when a GET request matches a search_term' do
				it 'displays the search request for product' do
					get :index, params: {q: 'Red Blade'}
					expect(assigns(:products)).to match_array([@product1])
					expect(response).to render_template('index')
				end
			end
		end


		describe "validations" do
			#testing validations
				context 'when a GET request matches no search_term' do
					it 'displays all products' do
						get :index
						expect(assigns(:products)).to.match_array([@product.all])
					end
				end
			end
		end


		describe 'GET #show' do
			context 'when a user opens show page' do
				it 'loads the show page' do
					get :show, id: @product.id
					expect(response).to have_http_status(200)
					expect(response).to be_ok
				end
			end
		end
	end
