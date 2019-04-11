require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get upcoming_events" do
    get events_upcoming_events_url
    assert_response :success
  end

end
