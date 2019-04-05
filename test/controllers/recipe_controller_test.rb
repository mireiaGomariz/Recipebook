require 'test_helper'

class RecipeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipe_index_url
    assert_response :success
  end

  test "should get home" do
    get recipe_home_url
    assert_response :success
  end

end
