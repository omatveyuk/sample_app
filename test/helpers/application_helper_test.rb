require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "CS 232 Ruby on Rails Development"
    assert_equal full_title("Help"), "Help | CS 232 Ruby on Rails Development"
  end
end