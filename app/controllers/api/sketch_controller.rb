module Api
  class SketchController < BaseController
    before_action :find_sketch, only: [:show, :update]

    def index
      @sketches = Sketch.limit 5
      render json: @sketches, each_serializer: SketchSerializer
    end

    def show
      render json: @sketch
    end

    def create
    end

    def update
      @sketch.update sketch_params
      render json: @sketch
    end

    private

    def find_sketch
      @sketch = Sketch.find params.require(:id)
    end

    def sketch_params
      params.slice(:boards, :links).permit!
    end
  end
end
