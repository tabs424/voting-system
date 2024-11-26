# frozen_string_literal: true

module PunditUnauthorizedPathHelper
  def unauthorized_redirect_path(policy_name, query)
    redirect_paths = {}
    redirect_paths[policy_name.to_sym]&.fetch(query.to_sym, nil)
  end
end
