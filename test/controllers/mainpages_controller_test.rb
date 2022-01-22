require "test_helper"

class MainpagesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get "/"
    assert_select "h1", "Welcome"
  end
end
