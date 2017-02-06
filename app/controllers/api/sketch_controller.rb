class Api::SketchController < ApplicationController
  def index
  end

  def show
    @sketch = Sketch.find params.require(:id)
    render json: @sketch
  end

  def create
  end

end
