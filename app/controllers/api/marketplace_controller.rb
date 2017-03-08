module Api
  class MarketplaceController < BaseController
    def index
      @sketches = Sketch.for_marketplace.limit 10

      respond_to do |format|
        format.json { render json: @sketches, each_serializer: SketchSerializer }
      end
    end

    def purchase
      @sketch = Sketch.create purchase_sketch_attributes.merge(new_params)
      respond_to do |format|
        format.json { render json: @sketch, status: :created }
      end
    end

    private

    def purchase_sketch_attributes
      Sketch
        .for_marketplace
        .find(params.require(:sketch_id))
        .attributes
        .with_indifferent_access
        .slice(:boards, :links, :name, :description)
    end

    def new_params
      {
        status: "closed",
        user: User.find(params.require(:user_id))
      }
    end
  end
end
