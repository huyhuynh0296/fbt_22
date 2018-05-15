module AbilityHelper
  include CanCan::Ability

  def manage?
    if user_signed_in?
      return true if current_user.role == 2
    end
  end

  def admin?
    if user_signed_in?
      return true if current_user.role == 1
    end
  end

  def is_user?
    if user_signed_in?
      return true if current_user.role == 0
    end
  end
end
