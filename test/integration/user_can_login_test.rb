require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

   test "user sees welcome page after logging in" do
     user = User.create(username: "Nathan", password: "password")

     visit root_path

     click_on "Login"

     assert_equal login_path, current_path

     fill_in "Username", with: "Nathan"
     fill_in "Password", with: "password"
     click_on "Login"

     assert_equal user_path(user), current_path
     assert page.has_content?("Welcome, Nathan")
   end
end
