require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #home' do
    it 'requires authentication' do
      get :home
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns a successful response for authenticated users' do
      user = create(:user, name: 'Prosper Kessie')
      sign_in user
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        user = create(:user)
        sign_in user
        group_params = { group: { name: 'New Category', icon: 'icon.png' } }
        post :create, params: group_params
        expect(Group.count).to eq(1)
      end

      it 'redirects to the home page with a success notice' do
        user = create(:user)
        sign_in user
        group_params = { group: { name: 'New Category', icon: 'icon.png' } }
        post :create, params: group_params
        expect(response).to redirect_to(home_categories_path)
        expect(flash[:notice]).to eq('Category was successfully created')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        user = create(:user)
        sign_in user
        group_params = { group: { name: '', icon: '' } }
        post :create, params: group_params
        expect(Group.count).to eq(0)
      end

      it 'redirects to the new category page with an error notice' do
        user = create(:user)
        sign_in user
        group_params = { group: { name: '', icon: '' } }
        post :create, params: group_params
        expect(response).to redirect_to(new_category_path)
        expect(flash[:notice]).to eq('Cannot create a new category')
      end
    end
  end
end
