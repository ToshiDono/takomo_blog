class ArticleDecorator < Draper::Decorator
  include PageData
  include HasHumanDate
  include HasUserData

  delegate_all
end
