require 'test_helper'

class HomeaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homea_index_url
    assert_response :success
  end

end
