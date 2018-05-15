class Ability
  include CanCan::Ability
  include AbilityHelper

  def initialize user

    user ||= User.new # guest user (not logged in)
    if user.present?
      if admin?
        can :manage, :all
      elsif users?
        can :manage, [Tour, Bookingtour, Comment, Rating, Userpay]
      elsif manage?
        can [:read, :update], User.can_for_manage
        can :manage, [Tour, Bookingtour, Comment, Rating, Userpay]
      end
    else
        can :read, :all
    end
  end
end
