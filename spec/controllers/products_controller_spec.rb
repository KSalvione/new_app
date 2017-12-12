require 'rails_helper'

	describe ProductsController, type: :controller do

		before do
			@user = FactoryGirl.create(:user)
			@admin = FactoryGirl.create(:admin)
			@product1 = FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", color: "red", price: "100")
			@product2 = FactoryGirl.create(:product, name: "Blue Blade", description: "Blue Blade", color: "blue", price: "100")
			@product3 = FactoryGirl.create(:product, name: "White Blade", description: "White Blade", color: "white", price: "100")
			@product4 = FactoryGirl.create(:product, name: "Pink Blade", description: "Pink Blade", color: "pink", price: "100")

		describe 'GET #index' do
			context 'when a GET request matches a search_term' do
				it 'displays the search request for product' do
					get :index, params: {q: 'Red Blade'}
					expect(assigns(:products)).to match_array([@product1])
					expect(response).to render_template('index')
				end
			end

			context 'when a GET request matches no search_term' do
				it 'displays all products' do
					get :index
					expect(assigns(:products)).to.match_array([@product.all])
				end
			end
		end
	end
end
