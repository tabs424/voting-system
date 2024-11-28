module Admin
  class SessionsPolicy < ApplicationPolicy
    def create?
      record.admin?
    end
  end
end
