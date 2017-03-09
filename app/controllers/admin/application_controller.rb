# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin, :default_params

    def authenticate_admin
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == Rails.application.secrets.admin_username && Digest::SHA256.hexdigest(password) == Rails.application.secrets.admin_password
      end
    end

    def default_params
      params[:order] ||= "id"
      params[:direction] ||= "asc"
    end
  end
end
