module LoginVerifier
  extend ActiveSupport::Concern

  def save_session_token
    token = Devise.friendly_token
    session[:user_token] = token
    resource.update(session_token: token)
  end

  def verify_registration
    if resource.save
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
      save_session_token
      flash[:notice] = t('devise.registrations.signed_up')
    else
      flash.now[:alert] = t('devise.registrations.signed_up_failed')
      redirect_failed_registration
    end
  end

  def redirect_failed_registration
    render :new
  end
end