class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_admin
  def current_admin
    current_user if current_user.try(:admin)
  end

  def admin_signed_in?
    current_admin.present?
  end

  def not_found!
    raise ActionController::RoutingError.new('Not Found')
  end

  def after_sign_in_path_for(resource)
    return admin_users_path if admin_signed_in?
    stored_location_for(resource) || root_path
  end
end
