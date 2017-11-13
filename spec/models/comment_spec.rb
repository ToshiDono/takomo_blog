require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :article }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:article_id) }
end
