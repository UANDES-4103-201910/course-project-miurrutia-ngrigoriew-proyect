require 'test_helper'

class UtotalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get utotal_index_url
    assert_response :success
  end

end
