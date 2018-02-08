require 'test_helper'

class CreationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get creations_new_url
    assert_response :success
  end

end
