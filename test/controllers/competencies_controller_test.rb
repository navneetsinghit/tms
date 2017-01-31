require 'test_helper'

class CompetenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get competencies_index_url
    assert_response :success
  end

end
