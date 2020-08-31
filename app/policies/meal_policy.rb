class MealPolicy < ApplicationPolicy
  def create?
    return true
  end

  def update?
    return user_is_owner_or_admin?
  end

  def destroy?
    return user_is_owner_or_admin?
  end

  private

   def user_is_owner_or_admin?
    # `record` == the equipment we passed in (usually @booking)
    # `user` == current_user

    return record.user_id == user.id || user.admin == true
  end

  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
