require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
    @non_activated_user = users(:archer)
    @activated_user = users(:michael)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete',
                                                    method: :delete
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
  
#  test "index as non_activated user" do
#    log_in_as(@non_activated_user)
#     get users_path
  #  get_via_redirect :users, id: @non_activated_user
    #follow_redirect!
#    assert_redirected_to root_url
#  end

#  test "index as activated user" do
#    log_in_as(@activated_user)
#    get users_path
    #get :user, id: @non_activated_user
    #follow_redirect!
#    assert_redirected_to @user
#  end
end

