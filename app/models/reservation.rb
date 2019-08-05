class Reservation < ApplicationRecord
  enum status: {Waiting: 0, Approved: 1, Declined: 2}

  after_create_commit :create_notification

  belongs_to :user
  belongs_to :room

  scope :current_week_revenue, -> (user) {
    joins(:room)
    .where("rooms.user_id = ? AND reservations.updated_at >= ? AND reservations.status = ?", user.id, 1.week.ago, 1)
    .order(updated_at: :asc)
  }
end
