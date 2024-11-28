class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include PunditUnauthorizedPathHelper

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    redirect_to(unauthorized_redirect_path(policy_name, exception.query) || request.referer || client_root_path)
  end
end
