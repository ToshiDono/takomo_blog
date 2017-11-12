class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # Guest User
    if user.new_record?
      can :read, :all
    else
      # All registered users
      can [:read, :write], :all
      # Articles owner
      can :update, Article do |article|
        article.try(:user) == user
      end
    end
  end
end
