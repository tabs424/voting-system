class Admin::RegistrationsController < Devise::RegistrationsController
  layout 'admin'
  include LoginVerifier

  before_action :configure_sign_up_params, only: :create

  def create
    self.resource = resource_class.new(student_id: params[:admin_user][:student_id],
                                       password: params[:admin_user][:password],
                                       password_confirmation: params[:admin_user][:password_confirmation],
                                       name: params[:admin_user][:name],
                                       role: :admin)
    verify_registration
  end


  protected

  def after_sign_up_path_for(resource)
    admin_root_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:student_id, :name, :password, :password_confirmation)
    end
  end
end
