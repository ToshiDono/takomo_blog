require 'rails_helper'

RSpec.describe Articles::FeedsController, type: :controller do
  render_views

  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }

  before { sign_in user_1 }

  let!(:article_1) { create(:article, user: user_1) }
  let!(:article_2) { create(:article, user: user_1) }
  let!(:article_3) { create(:article, user: user_2) }

  describe 'GET #index' do

    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'loads all articles' do
      expect(assigns(:articles)).to match_array([article_1, article_2, article_3])
    end
  end
end
