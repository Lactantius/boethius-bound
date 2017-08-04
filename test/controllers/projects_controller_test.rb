require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers
 
  test "should redirect to login if not logged in" do
    get projects_url
    assert_response :redirect
  end

  test "should get index" do
    sign_in users(:normal)
    get projects_url
    assert_response :success
  end

  test "should get new project page" do
    sign_in users(:normal)
    get new_project_url
    assert_response :success
  end

  test "should make new project" do
    sign_in users(:normal)
    get new_project_url
    post "/projects",
      params: { project: { name: "Bob", user_id: users(:normal).id } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Bob"
    click_on "Add Books"
  end

end
