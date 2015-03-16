require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Sign up | CS 232 Ruby on Rails Development"
  end

end  