require "administrate/base_dashboard"

class RoomDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  # permitted for has_many_attached
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    images: Field::ActiveStorage,
    cover: Field::ActiveStorage,
    user: Field::BelongsTo,
    reservations: Field::HasMany,
    guest_reviews: Field::HasMany,
    calendars: Field::HasMany,
    id: Field::Number,
    room_type: Field::String,
    accommodate: Field::Number,
    listing_name: Field::String,
    summary: Field::Text,
    address: Field::String,
    is_tv: Field::Boolean,
    is_kitchen: Field::Boolean,
    is_air: Field::Boolean,
    is_heating: Field::Boolean,
    is_internet: Field::Boolean,
    price: Field::Number,
    active: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    instant: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :reservations,
    :guest_reviews,
    :calendars,
    :id,
    :room_type,
    :accommodate,
    :listing_name,
    :summary,
    :address,
    :is_tv,
    :is_kitchen,
    :is_air,
    :is_heating,
    :is_internet,
    :price,
    :active,
    :created_at,
    :updated_at,
    :latitude,
    :longitude,
    :instant,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :images,
    :cover,
    :user,
    :reservations,
    :guest_reviews,
    :calendars,
    :room_type,
    :accommodate,
    :listing_name,
    :summary,
    :address,
    :is_tv,
    :images,
    :is_kitchen,
    :is_air,
    :is_heating,
    :is_internet,
    :price,
    :active,
    :latitude,
    :longitude,
    :instant,
  ].freeze

  # Overwrite this method to customize how rooms are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(room)
  #   "Room ##{room.id}"
  # end
  def permitted_attributes
    super + [:images => []]
  end
end
