module Admin
  class SketchesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Sketch.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Sketch.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def resource_params
      new_params = params.require(:sketch).slice(*permitted_attributes).permit!
      new_params[:links] = JSON.parse(new_params[:links])
      new_params[:boards] = JSON.parse(new_params[:boards])
      new_params
    end
  end
end
