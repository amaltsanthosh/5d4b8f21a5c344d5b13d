# frozen_string_literal: true

require 'rails_helper'

# Change this ArticlesController to your project
RSpec.describe Api::UserController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Article. As you add validations to Article, be sure to adjust the attributes here as well.
  let!(:user) { create(:user) }

  describe 'Get User#index' do
    context 'Get all users' do
      it 'returns all users' do
        request.content_type = 'application/json'
        get :index, params: {}
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Post User#create' do
    context 'Create a user' do
      it 'creates a user' do
        request.content_type = 'application/json'
        post :create, params: { id: 4, firstName: 'Amal', lastName: 'TS', email: 'amal@gmail.com' }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'Get User#show' do
    context 'Get a single user' do
      it 'returns a single user' do
        request.content_type = 'application/json'
        get :show, params: { id: 4 }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Put User#update' do
    context 'updates a single user' do
      it 'updates all users' do
        request.content_type = 'application/json'
        put :update, params: { id: 4, firstName: 'Amal', lastName: 'T S', email: 'amal1@gmail.com' }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Delete User#destroy' do
    context 'destroys a single user' do
      it 'delete a single user' do
        request.content_type = 'application/json'
        delete :destroy, params: { id: 4 }
        expect(response).to have_http_status(200)
      end
    end
  end
end
