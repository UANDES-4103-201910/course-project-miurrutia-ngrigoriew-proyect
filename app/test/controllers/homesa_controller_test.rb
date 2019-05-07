require 'test_helper'

class HomesaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homesa_index_url
    assert_response :success
  end

end
