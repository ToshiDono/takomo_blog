class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, :user_id, :article_id, presence: true
end
