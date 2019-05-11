require 'test_helper'

class AtotalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get atotal_index_url
    assert_response :success
  end

end
