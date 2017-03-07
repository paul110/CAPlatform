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

    def register
      @boards = find_board_partial
      @boards.each do |board|
        board.update register_status: 'pending', user: User.first
        ActionCable.server.broadcast 'register_channel', board: board, type: 'board_details'
      end
      respond_to do |format|
        format.json { render json: @boards }
      end
    end

    private


    def board_params
      params.require(:mac)
    end

    def update_board_params
      params.permit(:name, :maintype, :type)
    end

    def find_board
      Board.find_by(mac: params[:id]).presence || Board.find(params[:id])
    end

    def find_board_partial
      suffix = "%#{params[:code]}"
      Board.where(register_status: 0, status: 'online').where('mac LIKE :suffix', suffix: suffix)
    end
  end
end
