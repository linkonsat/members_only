require "test_helper"

class MainpagesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get "/"
    assert_select "h1", "Welcome to the club!"
  end

  test "Should redirect to users page when sign in is selected." do

end

test "Should redirect to the user signup page when signup button is clicked" do
end
end
