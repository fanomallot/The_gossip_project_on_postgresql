require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get page_team_url
    assert_response :success
  end

end
