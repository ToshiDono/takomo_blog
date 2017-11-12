class ArticleDecorator < Draper::Decorator
  include PageData
  delegate_all
end
