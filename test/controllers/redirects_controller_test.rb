require 'test_helper'

class RedirectsControllerTest < ActionDispatch::IntegrationTest
  test "should get process" do
    get process_redirect_url
    assert_response :success
  end
end
