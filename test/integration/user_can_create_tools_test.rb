require 'test_helper'

class UserCanCreateToolsTest < ActionDispatch::IntegrationTest
   test "user sees tool that was created" do
     user = User.create(username: "Nathan", password: "password")

     visit root_path

     click_on "Login"

     fill_in "Username", with: "Nathan"
     fill_in "Password", with: "password"
     click_on "Login"

     assert page.has_content?("Welcome, Nathan")

     click_on "Create tool"

    fill_in "Name", with: "Hammer"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "10"

    click_button "Create Tool"

    assert_equal current_path, tool_path(Tool.last)

    within('.tool_info') do
      assert page.has_content?("Hammer")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
   end
end
