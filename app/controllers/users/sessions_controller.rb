module Users
  class SessionsController < Devise::SessionsController
    include LoginVerifier

    after_action :save_session_token, only: :create

    def create
      authorize User.find_by(student_id: params[:user][:student_id]),
                policy_class: User::SessionsPolicy
      self.resource = resource_class.find_by(student_id: params[:user][:student_id])
      super
    end

    protected

    def after_sign_in_path_for(_resource)
      users_root_path
    end
  end
end
