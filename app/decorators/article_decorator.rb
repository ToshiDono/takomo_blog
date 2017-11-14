class ArticleDecorator < Draper::Decorator
  include PageData
  include HasHumanDate
  include HasUserData

  decorates_association :comments
  delegate_all
end
