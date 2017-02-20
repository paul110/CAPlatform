module Api
  class SketchController < BaseController
    before_action :find_sketch, only: [:show, :update]

    def index
      @sketches = Sketch.order(:id).limit 20
      render json: @sketches, each_serializer: SketchSerializer
    end

    def show
      render json: @sketch
    end

    def create
      @sketch = Sketch.create(sketch_params)
      render json: @sketch
    end

    def update
      save_draft_or_activate
      respond_to do |format|
        if @sketch.valid?
          format.json { render json: @sketch, status: :ok }
        else
          format.json { render errors: @sketch.errors.full_messages.join(", "), status: :unprocessable_entity }
        end
      end
    end

    private

    def find_sketch
      @sketch = Sketch.find params.require(:id)
    end

    def sketch_params
      params.slice(:boards, :links, :status).permit!
    end

    def save_draft_or_activate
      @sketch.assign_attributes sketch_params
      if params[:status] == "pending"
        @sketch.save_draft
      else
        # make the last draft active or just save
        @sketch.draft.publish! if @sketch.draft?
        @sketch.save
      end
    end
  end
end
