Rails.application.routes.draw do
  constraints(UserDomainConstraint.new) do
    root to: 'home#index', as: :users_root

    devise_for :users, controllers: { registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  end

  constraints(AdminDomainConstraint.new) do
    scope module: 'admin' do
      root to: 'home#index', as: :admin_root

      devise_for :users, controllers: { registrations: 'admin/registrations',
                                        sessions: 'admin/sessions' }, as: :admin
    end
  end
end
