# frozen_string_literal: true

class AdminDomainConstraint
  def initialize; end

  def matches?(request)
    domains = Rails.application.config_for(:domain)[:admins]
    domains.include?(request.domain.downcase)
  end
end
