require 'test_helper'

class CollinsWordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
