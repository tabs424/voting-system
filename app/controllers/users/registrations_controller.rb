class Users::RegistrationsController < Devise::RegistrationsController
  include LoginVerifier

  before_action :configure_sign_up_params, only: :create

  def create
    self.resource = resource_class.new(student_id: params[:user][:student_id],
                                       password: params[:user][:password],
                                       password_confirmation: params[:user][:password_confirmation],
                                       name: params[:user][:name],
                                       role: :student)
    verify_registration
  end

  protected

  def after_sign_up_path_for(resource)
    client_root_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:student_id, :name, :password, :password_confirmation)
    end
  end
end
