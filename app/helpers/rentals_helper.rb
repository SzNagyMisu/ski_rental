module RentalsHelper
  def rental_t(key, options = {})
    t("activerecord.attributes.rental.#{key}", options)
  end
end
