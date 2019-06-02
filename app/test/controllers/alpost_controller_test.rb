require 'test_helper'

class AlpostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get alpost_index_url
    assert_response :success
  end

end
