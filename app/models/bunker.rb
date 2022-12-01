class Bunker < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_one_attached :cover_photo

  validates :name, presence: true
  validates :photos, length: { minimum: 4 }
  validates :cover_photo, length: { minimum: 1 }

  include PgSearch::Model

  pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
