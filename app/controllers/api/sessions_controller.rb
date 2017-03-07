module Api
  class SessionsController < BaseController
    def create
      @user = find_or_create_user
      respond_to do |format|
        format.json { render json: @user, status: :created }
      end
    end

    private

    def find_or_create_user
      User.find_or_create_by(name: params.require(:name), email: params.require(:email))
    end
  end
end
