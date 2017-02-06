class Box < ApplicationRecord
  has_many :rentals
  has_one :active_rental, -> { active }, class_name: Rental

  scope :free, -> { where.not(id: Rental.active.pluck(:box_id)) }

  def location
    "#{col} / #{row}"
  end

  def serial
    active_rental&.serial
  end
end
