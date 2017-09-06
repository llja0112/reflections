require 'test_helper'

class ReflectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reflections_new_url
    assert_response :success
  end

  test "should get show" do
    get reflections_show_url
    assert_response :success
  end

end
