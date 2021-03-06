require "administrate/base_dashboard"

class SketchDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    links: Field::JSON,
    boards: Field::JSON,
    name: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    published_at: Field::DateTime,
    trashed_at: Field::DateTime,
    listed: Field::Boolean,
    status: Field::String.with_options(searchable: false),
    user_details: Field::String,
    user: Field::BelongsTo
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :user_details,
    :listed
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :links,
    :boards,
    :created_at,
    :updated_at,
    :published_at,
    :trashed_at,
    :status,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :links,
    :boards,
    :published_at,
    :trashed_at,
    :status,
    :name,
    :description,
    :listed
  ].freeze

  # Overwrite this method to customize how sketches are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(sketch)
    "Sketch #{sketch.name}"
  end
end
