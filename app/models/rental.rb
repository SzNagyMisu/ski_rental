class Rental < ApplicationRecord
  belongs_to :box

  attr_accessor :price, :fine


  RENTAL_DAYS_MAX = 3.freeze
  RENTAL_DAILY_PRICE = 10.freeze
  FINE_DAILY_PRICE = 100.freeze


  validates_presence_of :box_id, :customer_name, :customer_identifier
  validates :days,
            numericality: {only_integer: true,
                           greater_than: 0,
                           less_than_or_equal_to: RENTAL_DAYS_MAX}
  validate :days_not_decrement, if: 'days.present?'


  before_create :generate_serial
  before_save :count_payed


  scope :active, -> { where(is_active: true) }
  scope :search, -> (serial) { where(serial: serial) if serial.present? }

  def count_fine
    [(Date.today - (created_at.to_date + days.days)).to_i * FINE_DAILY_PRICE, 0].max
  end


  private

    def days_not_decrement
      if days < days_was.to_i
        errors.add :days, :greater_than_or_equal_to, count: days_was
      end
    end

    def generate_serial
      self.serial = SecureRandom.urlsafe_base64(5).upcase
    end

    def count_payed
      self.payed = payed.to_i + price.to_i + fine.to_i
    end

end
