module Api
  class SketchController < BaseController
    def index
    end

    def show
      @sketch = Sketch.find params.require(:id)
      render json: {data: @sketch}
    end

    def create
    end

    def update
      @sketch = Sketch.find params.require(:id)
      @sketch.update sketch_params
      render json: {data: @sketch}
    end

    private
    def sketch_params
      params.slice(:boards, :links).permit!
    end
  end
end
