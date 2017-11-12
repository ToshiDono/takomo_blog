require 'rails_helper'

RSpec.describe 'articles/_form', type: :view do
  let(:user) { create(:user) }
  before { sign_in user }

  context 'page have a labels:' do
    let(:article) { create(:article) }
    let!(:item) do
      assign(:article, article.decorate)
      render
    end

    it I18n.t('activerecord.attributes.article.title') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.article.title'))
    end

    it I18n.t('activerecord.attributes.article.text') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.article.text'))
    end
  end

  context 'new article' do
    let(:article) { build(:article) }
    let!(:item) do
      assign(:article, article.decorate)
      render
    end

    it 'page have empty input field for title' do
      expect(rendered).to have_selector('input#article_title')
    end

    it 'page have empty input field for text' do
      expect(rendered).to have_selector('input#article_text')
    end
  end

  context 'edit article' do
    let(:article) { create(:article) }
    let!(:item) do
      assign(:article, article.decorate)
      render
    end

    it 'page have article title' do
      expect(rendered).to have_selector("input#article_title[value='#{article.title}']")
    end

    it 'page have article text' do
      expect(rendered).to have_selector("input#article_text[value='#{article.text}']")
    end
  end
end
