require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
 test "user see the root url" do
     user = User.create(username: "Nathan", password: "password")

     visit root_path
     click_on "Login"
     fill_in "Username", with: "Nathan"
     fill_in "Password", with: "password"
     click_on "Login"
     click_on "Log out"
     assert_equal root_path, current_path
     refute page.has_content?("Welcome, Nathan")
 end
end
