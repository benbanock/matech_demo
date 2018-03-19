require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get project_show_url
    assert_response :success
  end

end
