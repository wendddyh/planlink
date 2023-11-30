class AttendancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user:user)
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end
end
