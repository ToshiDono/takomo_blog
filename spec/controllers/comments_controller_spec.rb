require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  render_views

  let(:user) { create(:user) }

  before { sign_in user }

  let(:article) { create(:article) }
  let(:comment) { create(:comment, article: article, user: user) }

  describe 'POST #create' do
    it 'redirect to article#show' do
      post :create, params: { comment: attributes_for(:comment), article_id: article.id }
      expect(response).to redirect_to assigns(:article)
    end
  end

  describe 'POST #destroy' do
    it 'returns http 302' do
      delete :destroy, params: { id: comment.id, article_id: article.id }
      expect(response).to redirect_to assigns(:article)
    end
  end
end
