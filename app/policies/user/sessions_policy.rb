class User::SessionsPolicy < ApplicationPolicy
  def create?
    record.student? || record.admin?
  end
end
