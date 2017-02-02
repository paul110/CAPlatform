module Api
  class BoardController < BaseController
    def index
      render json: { ok: true }, status: :ok
    end
  end
end
