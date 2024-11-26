# frozen_string_literal: true

class UserDomainConstraint
  def initialize; end

  def matches?(request)
    domains = Rails.application.config_for(:domain)[:users]
    domains.include?(request.domain.downcase)
  end
end
