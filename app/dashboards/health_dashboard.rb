require "administrate/base_dashboard"

class HealthDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    posts: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    number: Field::String,
    link: Field::String,
    email: Field::String,
    services: Field::Text,
    about: Field::Text,
    address: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    status: Field::Boolean,
    accepted_documents: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :posts,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :posts,
    :id,
    :name,
    :number,
    :link,
    :email,
    :services,
    :about,
    :address,
    :latitude,
    :longitude,
    :created_at,
    :updated_at,
    :status,
    :accepted_documents,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :posts,
    :name,
    :number,
    :link,
    :email,
    :services,
    :about,
    :address,
    :latitude,
    :longitude,
    :status,
    :accepted_documents,
  ].freeze

  # Overwrite this method to customize how healths are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(health)
  #   "Health ##{health.id}"
  # end
end
