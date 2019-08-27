require "administrate/base_dashboard"

class EducationDashboard < Administrate::BaseDashboard
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
    email: Field::String,
    about: Field::Text,
    accepted_documents: Field::String,
    services: Field::Text,
    status: Field::Boolean,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    address: Field::String,
    link: Field::String,
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
    :email,
    :about,
    :accepted_documents,
    :services,
    :status,
    :latitude,
    :longitude,
    :created_at,
    :updated_at,
    :address,
    :link,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :posts,
    :name,
    :number,
    :email,
    :about,
    :accepted_documents,
    :services,
    :status,
    :latitude,
    :longitude,
    :address,
    :link,
  ].freeze

  # Overwrite this method to customize how educations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(education)
  #   "Education ##{education.id}"
  # end
end
