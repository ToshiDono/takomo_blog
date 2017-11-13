class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :user_id, presence: true
end
