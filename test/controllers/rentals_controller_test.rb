require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental = rentals(:one)
  end

  test "should get index" do
    get rentals_url
    assert_response :success
  end

  test "should get new" do
    get new_rental_url
    assert_response :success
  end

  test "should create rental" do
    assert_difference('Rental.count') do
      post rentals_url, params: { rental: { box_id: @rental.box_id, days: @rental.days, payed: @rental.payed, is_active: @rental.is_active, customer_identifier: @rental.customer_identifier, customer_name: @rental.customer_name } }
    end

    assert_redirected_to rental_url(Rental.last)
  end

  test "should show rental" do
    get rental_url(@rental)
    assert_response :success
  end

  test "should get edit" do
    get edit_rental_url(@rental)
    assert_response :success
  end

  test "should update rental" do
    patch rental_url(@rental), params: { rental: { box_id: @rental.box_id, days: @rental.days, payed: @rental.payed, is_active: @rental.is_active, customer_identifier: @rental.customer_identifier, customer_name: @rental.customer_name } }
    assert_redirected_to rental_url(@rental)
  end

  test "should destroy rental" do
    assert_difference('Rental.active.count', -1) do
      delete rental_url(@rental)
    end

    assert_redirected_to rentals_url
  end
end
