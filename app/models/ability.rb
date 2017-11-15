class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # Guest User
    if user.new_record?
      can :read, :all
    else
      # All registered users
      can [:read, :create], :all
      # Articles owner
      can [:update, :destroy], [ArticleDecorator, CommentDecorator, Comment], user_id: user.id
    end
  end
end
