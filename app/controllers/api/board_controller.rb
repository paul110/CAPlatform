module Api
  class BoardController < BaseController
    def index
      @board = Board.first
      render json: { led: @board.button }, status: :ok
    end

    def create
      @board = Board.find_or_create_by(uid: params[:mac])
      @board.update board_params
      render json: { ok: true }, status: :created
    end
    private

    def board_params
      params[:button] = params[:button] == "True"
      params.permit(:button)
    end

  end
end
