require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  let(:article) { create(:article) }

  context 'signed in' do
    let(:user) { create(:user, articles: [article]) }

    before { sign_in user }

    describe 'GET #show' do
      before { get :show, params: { id: article.id} }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'load article' do
        expect(assigns(:article)).to eq(article)
      end
    end

    describe 'GET #new' do
      before { get :new }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #edit' do
      before { get :edit, params: { id: article.id} }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end

    describe 'POST #create' do
      context 'valid data' do
        it 'redirect to show' do
          post :create, params: { article: attributes_for(:article) }
          expect(response).to redirect_to assigns(:article)
        end
      end

      context 'not valid data' do
        it 'renders the new template' do
          post :create, params: { article: { title: nil } }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'POST #update' do
      context 'valid data' do
        it 'redirect to show' do
          patch :update, params: { id: article.id, article: attributes_for(:article) }
          expect(response).to redirect_to assigns(:article)
        end
      end

      context 'not valid data' do
        it 'renders the edit template' do
          patch :update, params: { id: article.id, article: { title: nil }}
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'POST #destroy' do
      it 'returns http 302' do
        delete :destroy, params: { id: article.id }
        expect(response).to redirect_to controller: 'articles/feeds', action: :index
      end
    end
  end

  context 'guest' do
    describe 'GET #show' do
      it 'returns http success' do
        get :show, params: { id: article.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'returns http 302' do
        get :new
        expect(response).to user_sign_in
      end
    end

    describe 'GET #edit' do
      it 'returns http 302' do
        get :edit, params: { id: article.id }
        expect(response).to user_sign_in
      end
    end
  end
end
