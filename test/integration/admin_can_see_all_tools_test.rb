require "test_helper"

class AdminCanSeeAllToolTest < ActionDispatch::IntegrationTest

  test "admin can see all tools created" do
    admin = User.create(username: "joe", password: "password", role: 1)
    user1 = User.create(username: "nate", password: "password", role: 0)
    user2 = User.create(username: "chad", password: "password", role: 0)
    user1.tools.create(name: "Hammer", price: "1099", quantity: "10")
    user2.tools.create(name: "screwdriver", price: "1099", quantity: "10")

    ApplicationController.any_instance.stubs(:current_user).returns(user1)
    visit user_path(user1.id)
    click_on "Log out"
    ApplicationController.any_instance.stubs(:current_user).returns(user2)
    visit user_path(user2.id)
    click_on "Log out"
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_path
    click_on "Tools"
    assert page.has_content?("Hammer")
    assert page.has_content?("screwdriver")
  end
end
