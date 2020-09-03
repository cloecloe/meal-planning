class CalendarPolicy < ApplicationPolicy
  def new?
    return true
  end

  def share?
    user.calendar = record
  end

  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
