require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get courses_index" do
    get dashboard_courses_index_url
    assert_response :success
  end

  test "should get bookings_index" do
    get dashboard_bookings_index_url
    assert_response :success
  end

end
