require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  let(:article) { create(:article).decorate }
  let(:user) { create(:user) }
  before { sign_in user }
  let!(:item) do
    assign(:article, article)
    render
  end

  it 'page have articles title' do
    expect(rendered).to have_selector('h3', text: article.title)
  end
  it 'page have articles text' do
    expect(rendered).to have_selector('div', text: article.text)
  end
end
