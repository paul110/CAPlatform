module Api
  class SketchController < BaseController
    before_action :find_sketch, only: [:show, :update, :destroy]

    def index
      @sketches = sketch_scope.order(:id).limit 20
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
      @sketch = sketch_scope.find params.require(:id)
    end

    def sketch_scope
      Sketch.for_user params.require(:user_id)
    end

    def sketch_params
      params.require(:sketch).slice(:boards, :links, :status, :name, :description).permit!
    end

  end
end
