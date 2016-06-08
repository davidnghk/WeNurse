require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post :create, booking: { dropoff_location_id: @booking.dropoff_location_id, end_datetime: @booking.end_datetime, helper_class: @booking.helper_class, hourly_rate: @booking.hourly_rate, pickup_location_id: @booking.pickup_location_id, server_id: @booking.server_id, start_datetime: @booking.start_datetime, status: @booking.status, total_fee: @booking.total_fee, trip_type: @booking.trip_type, user_id: @booking.user_id }
    end

    assert_redirected_to booking_path(assigns(:booking))
  end

  test "should show booking" do
    get :show, id: @booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking
    assert_response :success
  end

  test "should update booking" do
    patch :update, id: @booking, booking: { dropoff_location_id: @booking.dropoff_location_id, end_datetime: @booking.end_datetime, helper_class: @booking.helper_class, hourly_rate: @booking.hourly_rate, pickup_location_id: @booking.pickup_location_id, server_id: @booking.server_id, start_datetime: @booking.start_datetime, status: @booking.status, total_fee: @booking.total_fee, trip_type: @booking.trip_type, user_id: @booking.user_id }
    assert_redirected_to booking_path(assigns(:booking))
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete :destroy, id: @booking
    end

    assert_redirected_to bookings_path
  end
end
