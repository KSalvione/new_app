require 'rails_helper'

describe ProductsController, type: :controller do

	# before do
	# 	@user = FactoryGirl.create(:user)
	# 	@admin = FactoryGirl.create(:user, admin: true)
	# 	@product1 = FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", colour: "red", price: "100")
	# 	@product2 = FactoryGirl.create(:product, name: "Blue Blade", description: "Blue Blade", colour: "blue", price: "100")
	# 	@product3 = FactoryGirl.create(:product, name: "White Blade", description: "White Blade", colour: "white", price: "100")
	# 	@product4 = FactoryGirl.create(:product, name: "Pink Blade", description: "Pink Blade", colour: "pink", price: "100")
	# end

	describe 'GET #index' do
		let!(:product1) { FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", colour: "red", price: "100")}
		let!(:product2) { FactoryGirl.create(:product, name: "Blue Blade", description: "Blue Blade", colour: "blue", price: "100")}

		context 'when a GET request matches a search_term' do
			it 'displays the search request for product' do
				get :index, params: {q: 'Red Blade'}
				expect(assigns(:products)).to match_array([product1])
				expect(response).to render_template('index')
			end
		end

		context 'when a GET request matches no search_term' do
			it 'displays all products' do
				get :index
				expect(assigns(:products)).to match_array([product1, product2])
			end
		end

		context 'when a GET request matches no search_term' do
			it 'displays all products' do
				get :index
				expect(assigns(:products)).to match_array(Product.all)
			end
		end
	end


	describe 'GET #show' do
		let(:product) { FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", colour: "red", price: "100")}

		context 'when a user opens show page' do
			it 'loads the show page' do
				get :show, params: {id: product.id}
				expect(assigns(:product)).to eql(product)
				expect(response).to be_ok
			end
		end
	end

	describe 'GET #new' do
		it 'loads the new product form' do
			get :new
			expect(assigns(:product).id).to be_nil
			expect(response).to be_ok
		end
	end

	describe 'POST #create' do
		it 'creates a new product' do
			post :create, params: {product: {name: "Test Product", description: "Test description"}}

			product = Product.first
			expect(product.name).to eql("Test Product")
			expect(product.description).to eql("Test description")
			expect(response).to redirect_to(product_path(product))
		end

		it 'handles invalid attributes' do
			post :create, params: {product: {name: ""}}
			expect(Product.first).to be_nil
			expect(response).to render_template(:new)
		end
	end

	describe 'GET #edit' do
		let(:product) { FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", colour: "red", price: "100")}

		context 'when a user opens edit product page' do
			it 'loads the edit product page' do
				get :edit, params: {id: product.id}
				expect(assigns(:product)).to eql(product)
				expect(response).to be_ok
			end
		end
	end

	describe 'PUT/PATCH #update' do
		let(:product) { FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", colour: "red", price: "100")}

		it 'updates a product' do
			post :update, params: {id: product.id, product: {name: "Test Product", description: "Test description"}}
			product.reload
			expect(product.name).to eql("Test Product")
			expect(product.description).to eql("Test description")
			expect(response).to redirect_to(product_path(product))
		end

		it 'handles invalid attributes' do
			post :update, params: {id: product.id, product: {name: ""}}
			product.reload
			expect(product.name).to eql("Red Blade")
			expect(response).to render_template(:edit)
		end
	end

	describe 'DELETE #destroy' do
		let(:product) { FactoryGirl.create(:product, name: "Red Blade", description: "Red Blade", colour: "red", price: "100")}

		it 'deletes a product' do
			delete :destroy, params: {id: product.id}
			expect(Product.where(id: product.id).first).to be_nil
			expect(response).to redirect_to(products_path)
		end
	end
end
