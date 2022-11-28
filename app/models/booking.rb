class Booking < ApplicationRecord
  belongs_to :bunker
  belongs_to :user
end
