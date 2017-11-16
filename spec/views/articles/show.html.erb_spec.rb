require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  let(:article) { create(:article, comments: [create(:comment)]).decorate }
  let(:user) { create(:user) }
  before { sign_in user }
  let!(:item) do
    assign(:article, article)
    render
  end

  context 'articles#show' do
    it 'page have articles title' do
      expect(rendered).to have_selector('h3', text: article.title)
    end
    it 'page have articles text' do
      expect(rendered).to have_selector('div', text: article.text)
    end
  end
  context 'comments' do
    context 'page have a labels:' do
      it I18n.t('activerecord.attributes.comment.body') do
        expect(rendered).to have_selector('label', text: t('activerecord.attributes.comment.body'))
      end

      it 'page have empty textarea field for body' do
        expect(rendered).to have_selector('textarea#comment_body')
      end
    end

    context 'show comments body' do
      it 'page have a comments body' do
        expect(rendered).to have_selector('div', text: article.comments.first.body)
      end
    end
  end
end
