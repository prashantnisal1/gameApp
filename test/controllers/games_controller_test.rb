require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get games_index_url
    assert_response :success
  end

  test "should get start" do
    get games_start_url
    assert_response :success
  end

  test "should get end" do
    get games_end_url
    assert_response :success
  end

end
