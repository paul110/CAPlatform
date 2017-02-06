module Api
  class BoardController < BaseController
    def index
      @board = Board.first
      render json: { led: @board.button }, status: :ok
    end

    def create
      @board = Board.first
      @board.update board_params
      render json: { ok: true }, status: :created
    end
    private

    def board_params
      if params[:button].present?
        params[:button] = !@board.button
      end
      params.permit(:button)
    end

  end
end
