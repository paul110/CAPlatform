module Api
  class MarketplaceController < BaseController
    def index
      @sketches = Sketch.for_marketplace.limit 10

      respond_to do |format|
        format.json { render json: @sketches, each_serializer: SketchSerializer }
      end
    end
  end
end
