module AbilityHelper
  def manage?
    return true if current_user.role == 2
  end

  def admin?
    return true if current_user.role == 1
  end

  def users?
    return true if current_user.role == 0
  end
end
