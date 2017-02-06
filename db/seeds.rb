# We have only 10x10 boxes
(1..10).each do |col|
  (1..10).each do |row|
    Box.create(col: col, row: row)
  end
end

daily_price = Rental::RENTAL_DAILY_PRICE

# Some rentals from the past
Rental.create(box_id: 11, customer_name: 'John Doe', customer_identifier: '123456XY', days: 3, price: 3 * daily_price,
              is_active: false, created_at: Time.now - 7.days, updated_at: Time.now - 4.days)
Rental.create(box_id: 12, customer_name: 'John Wayne', customer_identifier: '423562ZA', days: 3, price: 3 * daily_price,
              is_active: false, created_at: Time.now - 6.days, updated_at: Time.now - 4.days)
Rental.create(box_id: 22, customer_name: 'Jimmy Beam', customer_identifier: '243553FA', days: 2, price: 2 * daily_price,
              fine: 3 * Rental::FINE_DAILY_PRICE,
              is_active: false, created_at: Time.now - 6.days, updated_at: Time.now - 1.days)

# Some rentals that are still active
# Some that are to be fined
Rental.create(box_id: 33, customer_name: 'Joan Doe', customer_identifier: '4235235TZ', days: 2, price: 2 * daily_price,
              is_active: true, created_at: Time.now - 6.days, updated_at: Time.now - 6.days)
Rental.create(box_id: 35, customer_name: 'Harry Johnson', customer_identifier: '9872432ZE', days: 3, price: 3 * daily_price,
              is_active: true, created_at: Time.now - 5.days, updated_at: Time.now - 5.days)
Rental.create(box_id: 98, customer_name: 'Henriette Johnson', customer_identifier: '9872432ZF', days: 1, price: 1 * daily_price,
              is_active: true, created_at: Time.now - 5.days, updated_at: Time.now - 5.days)

# And some that are not
Rental.create(box_id: 45, customer_name: 'John Watson', customer_identifier: '98484324JW', days: 3, price: 3 * daily_price,
              is_active: true, created_at: Time.now - 3.day, updated_at: Time.now - 3.day)
Rental.create(box_id: 64, customer_name: 'James Doe', customer_identifier: '3243525GH', days: 3, price: 3 * daily_price,
              is_active: true, created_at: Time.now - 1.day, updated_at: Time.now - 1.day)
Rental.create(box_id: 78, customer_name: 'Birdy Edwards', customer_identifier: '1111111AA', days: 2, price: 2 * daily_price,
              is_active: true, created_at: Time.now - 1.day, updated_at: Time.now - 1.day)