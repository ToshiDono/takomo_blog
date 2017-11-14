class CommentDecorator < Draper::Decorator
  include PageData
  include HasHumanDate
  include HasUserData

  decorates :comment

  delegate_all
end
