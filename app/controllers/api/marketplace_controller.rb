module Api
  class MarketplaceController < BaseController

    def index
      @sketches = Sketch.for_marketplace.limit 10

      respond_to do |format|
        format.json { render json: @sketches, each_serializer: SketchSerializer }
      end
    end

    def purchase
      @sketch = Purchaser.new(params.require(:sketch_id), params.require(:user_id)).purchase
      respond_to do |format|
        format.json { render json: @sketch, status: :created }
      end
    end

  end
end
