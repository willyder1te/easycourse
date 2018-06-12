class Course < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroys
end
