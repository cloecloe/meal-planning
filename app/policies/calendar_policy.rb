class CalendarPolicy < ApplicationPolicy
  def new?
    return true
  end

  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
