class Admin::SessionsPolicy < ApplicationPolicy
  def create?
    record.admin?
  end
end
