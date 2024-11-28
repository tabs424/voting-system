module User
  class SessionsPolicy < ApplicationPolicy
    def create?
      record.student? || record.admin?
    end
  end
end
