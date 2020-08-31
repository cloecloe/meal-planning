class ReviewPolicy < ApplicationPolicy
  def create?
    return true
  end

  def destroy?
    return user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    # `record` == the equipment we passed in (usually @equipment)
    # `user` == current_user

    return record.user_id == user.id || user.admin == true
  end

  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
