require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  describe "Admin signed in" do
    let!(:admin) { FactoryGirl.create(:user, admin: true) }

    before do
      sign_in admin
    end

    describe "GET new" do
      context 'if try to make new user' do
        it 'open form' do
          get :new

          expect(response).to have_http_status(:success)
          expect(response.content_type).to eq('text/html')
        end
      end
    end

    describe "POST create" do

      context 'if set valid params' do
        before do
          @params = {
            user: {
              full_name: 'Name', email: 'email@example.com', password: '123456', password_confirmation: '123456'
            }
          }
        end

        it 'create user' do
          post :create, params: @params

          expect(response).to have_http_status(:redirect)
          expect(response.content_type).to eq('text/html')
          expect(User.where(admin: false).count).to eq 1
        end
      end

      context 'if set not valid params' do
        before do
          @params = {
            user: { name: 'Name' }
          }
        end

        it 'not create user' do
          post :create, params: @params

          expect(response).to have_http_status(:success)
          expect(response.content_type).to eq('text/html')
          expect(User.where(admin: false).count).to eq 0
        end
      end
    end


    describe "GET show" do

      let(:user) { FactoryGirl.create(:user) }

      context 'if user exist in db' do
        it 'get user' do
          get :show, params: { id: user.id }

          expect(response).to have_http_status(:success)
          expect(response.content_type).to eq('text/html')
        end
      end

      context 'if user not exist in db' do
        it 'get 404 error' do
          expect { get :show, params: { id: -user.id } }.to raise_exception ActionController::RoutingError
        end
      end
    end

    describe "GET edit" do
      let(:user) { FactoryGirl.create(:user) }

      context 'if try to edit user' do
        it 'open edit form' do
          get :edit, params: { id: user.id}

          expect(response).to have_http_status(:success)
          expect(response.content_type).to eq('text/html')
        end
      end
    end

    describe "PATCH update" do
      let!(:user) { FactoryGirl.create(:user) }

      context 'if set correct values' do
        before do
          @params = {
            user: {
              full_name: 'Name'
            }
          }
        end

        it 'update user' do
          patch :update, params: @params.merge({ id: user.id })

          expect(response).to have_http_status(:redirect)
          expect(response.content_type).to eq('text/html')
          expect(User.where(admin: false).count).to eq 1
          expect(User.find(user.id).full_name).to eq 'Name'
        end
      end

      context 'if set incorrect values' do
        before do
          @params = {
            user: {
              full_name: ''
            }
          }
        end

        it 'not update user' do
          patch :update, params: @params.merge({ id: user.id })

          expect(response).to have_http_status(:success)
          expect(response.content_type).to eq('text/html')
          expect(User.find(user.id)).to eq user
          expect(User.find(user.id).full_name).not_to eq ''
        end
      end
    end

    describe "DELETE destroy" do
      let!(:user) { FactoryGirl.create(:user) }

      context 'if set valid params' do

        it 'user wil be deleted' do
          delete :destroy, params: { id: user.id }

          expect(response).to have_http_status(:redirect)
          expect(response.content_type).to eq('text/html')
          expect(User.find_by_id(user.id)).to eq nil
        end
      end

      context 'if try to delete non existent record' do
        it 'get 404 error' do
          expect { delete :destroy, params: { id: -user.id } }.to raise_exception ActionController::RoutingError
        end
      end
    end
  end

  describe "User signed in" do
    let!(:user) { FactoryGirl.create(:user, admin: false) }

    before do
      sign_in user
    end

    describe "GET new" do
      context 'if try to make new user' do
        it 'redirected' do
          get :new

          expect(response).to have_http_status(:redirect)
          expect(response.content_type).to eq('text/html')
        end
      end
    end
  end

  describe "No One" do
    describe "GET new" do
      context 'if try to make new user' do
        it 'redirected' do
          get :new

          expect(response).to have_http_status(:redirect)
          expect(response.content_type).to eq('text/html')
        end
      end
    end
  end

end
