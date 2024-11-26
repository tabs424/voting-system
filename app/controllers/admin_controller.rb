class AdminController < ActionController::Base
  layout 'admin'
  include Pundit::Authorization
  include PunditUnauthorizedPathHelper

  before_action :authenticate_admin_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    redirect_to(unauthorized_redirect_path(policy_name, exception.query) || request.referrer || admin_root_path)
  end
end
