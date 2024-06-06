require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get badges" do
    get users_badges_url
    assert_response :success
  end

end
