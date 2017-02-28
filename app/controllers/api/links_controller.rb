module Api
  class LinksController < BaseController
    def index
      respond_to do |format|
        format.json { render json: find_links }
      end
    end

    private

    def find_links
      CodeRunner::BEFORE_HOOKS.merge(CodeRunner::AFTER_HOOKS).map do |key, value|
        {
          name: key,
          description: value
        }
      end
    end

  end
end
