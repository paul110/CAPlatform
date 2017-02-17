module Api
  class BoardController < BaseController
    def index
      @boards = Board.where.not(mac: nil).order(:id).limit 10
      respond_to do |format|
        format.json { render json: @boards, each_serializer: BoardSerializer }
      end
    end

    def create
      @board = Board.first.update board_params
      ActionCable.server.broadcast 'sketch_channel', message: @board.button
      render json: @board, status: :created
    end

    def show
      @board = find_board
      respond_to do |format|
        format.json { render json: @board }
      end
    end

    private

    def board_params
      @board.toggle(:button) if params[:button].present?
      params.permit(:button)
    end

    def find_board
      Board.find_by(mac: params[:id]).presence || Board.find(params[:id])
    end
  end
end
