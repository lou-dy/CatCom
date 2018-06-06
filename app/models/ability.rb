class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :manage, Order, user_id: user.id
    cannot :destroy, Comment if user.role != "admin"
    can :manage, :all if user.role == "admin"
  end
end
