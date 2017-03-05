require "administrate/base_dashboard"

class BoardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    mac: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    status: Field::String.with_options(searchable: false),
    metadata: Field::String.with_options(searchable: false),
    last_active: Field::DateTime,
    name: Field::String,
    maintype: Field::String,
    type: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :mac,
    :name,
    :maintype
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :mac,
    :created_at,
    :updated_at,
    :status,
    :metadata,
    :last_active,
    :name,
    :maintype,
    :type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :mac,
    :status,
    :metadata,
    :last_active,
    :name,
    :maintype,
    :type,
  ].freeze

  # Overwrite this method to customize how boards are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(board)
    "Board<#{board.name}> Mac: #{board.mac}"
  end
end
