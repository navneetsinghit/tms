require 'test_helper'

class WeekControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get week_index_url
    assert_response :success
  end

  test "should get new" do
    get week_new_url
    assert_response :success
  end

  test "should get show" do
    get week_show_url
    assert_response :success
  end

end
