module Api
  class SketchController < BaseController
    before_action :find_sketch, only: [:show, :update, :destroy]

    def index
      @sketches = Sketch.order(:id).limit 20
      respond_to do |format|
        format.json { render json: @sketches, each_serializer: SketchSerializer }
      end
    end

    def show
      respond_to do |format|
        format.json { render json: @sketch }
      end
    end

    def create
      @sketch = Sketch.create(sketch_params)
      respond_to do |format|
        format.json { render json: @sketch }
      end
    end

    def update
      @sketch.update sketch_params
      respond_to do |format|
        if @sketch.valid?
          format.json { render json: @sketch, status: :ok }
        else
          format.json { render errors: @sketch.errors.full_messages.join(", "), status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @sketch.destroy
      head :no_content
    end

    private

    def find_sketch
      @sketch = Sketch.find params.require(:id)
    end

    def sketch_params
      params.slice(:boards, :links, :status, :name).permit!
    end

  end
end
