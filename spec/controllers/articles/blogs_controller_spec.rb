require 'rails_helper'

RSpec.describe Articles::BlogsController, type: :controller do
  render_views

  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }

  before { sign_in user_1 }

  let!(:article_1) { create(:article, user: user_1) }
  let!(:article_2) { create(:article, user: user_1) }
  let!(:article_3) { create(:article, user: user_2) }

  describe 'GET #show' do

    before { get :show, params: { id: user_1.id} }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'loads all my articles' do
      expect(assigns(:articles)).to match_array([article_1, article_2])
    end

    it 'loads only my articles' do
      expect(assigns(:articles)).to_not contain_exactly(article_3)
    end
  end
end
