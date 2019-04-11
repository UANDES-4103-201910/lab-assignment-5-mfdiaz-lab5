require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user_with_most_tickets" do
    get users_user_with_most_tickets_url
    assert_response :success
  end

end
