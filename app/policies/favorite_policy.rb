class FavoritePolicy < ApplicationPolicy
  # def index?
  #   return true
  # end

  def create?
    return true
  end

  private

  def user_is_owner_or_admin?
  # `record` == the equipment we passed in (usually @booking)
  # `user` == current_user

    return record.user_id == user.id || user.admin == true
  end

  class Scope < Scope
    def resolve
      # `scope` == Favorite class itself
      # Should return an array of all favorites you're authorized to see
      scope.includes(:recipe)
    end
  end
end
