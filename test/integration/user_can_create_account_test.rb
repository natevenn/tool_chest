require 'test_helper'

class UserCanCreateAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

   test "user sees the welcome page after creating an account" do
     #user visits the root url
     visit '/'
     #and then clicks on create accoutn
     click_on "Register"
     #then fills in the username
     fill_in "Username", with: "Nathan"
     #and password
     fill_in "Password", with: "password"
     #then hits submit
     click_on "Create Account"
     #and then sees the welcome page
     user = User.last
     assert_equal user_path(user.id), current_path
     assert page.has_content?("Welcome, Nathan")
   end
end
