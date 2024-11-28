module Admin
  class SessionsController < Devise::SessionsController
    layout 'admin'
    include LoginVerifier

    after_action :save_session_token, only: :create

    def create
      authorize User.find_by(student_id: params[:admin_user][:student_id]),
                policy_class: Admin::SessionsPolicy
      request.params[:admin_user].merge!(params.require(:admin_user).permit(:student_id))
      super
    end

    protected

    def after_sign_in_path_for(_resource_or_scope)
      admin_root_path
    end

    def after_sign_out_path_for(_resource_or_scope)
      new_admin_user_session_path
    end
  end
end
