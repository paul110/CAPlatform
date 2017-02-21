module Api
  class BoardController < BaseController
    def index
      @boards = Board.where.not(mac: nil).order(:id).limit 10
      respond_to do |format|
        format.json { render json: @boards, each_serializer: BoardSerializer }
      end
    end

    def create
      @board = Board.create(board_params)
    end

    def show
      @board = find_board
      respond_to do |format|
        format.json { render json: @board }
      end
    end

    def update
      @board = find_board
      @board.update update_board_params
      render json: {}, status: :ok
    end

    private


    def board_params
      params.require(:mac)
    end

    def update_board_params
      params.permit(:name, :button, :maintype, :subtype)
    end

    def find_board
      Board.find_by(mac: params[:id]).presence || Board.find(params[:id])
    end
  end
end
