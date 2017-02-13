module Api
  class BoardController < BaseController
    def index
      @boards = Board.where.not(uid: nil).limit 10
      render json: @boards, each_serializer: BoardSerializer
    end

    def create
      @board = Board.first.update board_params
      ActionCable.server.broadcast 'sketch_channel', message: @board.button
      render json: @board, status: :created
    end
    private

    def board_params
      @board.toggle(:button) if params[:button].present?
      params.permit(:button)
    end

  end
end
