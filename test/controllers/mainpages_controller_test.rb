require "test_helper"

class MainpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mainpage = mainpages(:one)
  end

  test "should get index" do
    get mainpages_url
    assert_response :success
  end

  test "should get new" do
    get new_mainpage_url
    assert_response :success
  end

  test "should create mainpage" do
    assert_difference("Mainpage.count") do
      post mainpages_url, params: { mainpage: {  } }
    end

    assert_redirected_to mainpage_url(Mainpage.last)
  end

  test "should show mainpage" do
    get mainpage_url(@mainpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_mainpage_url(@mainpage)
    assert_response :success
  end

  test "should update mainpage" do
    patch mainpage_url(@mainpage), params: { mainpage: {  } }
    assert_redirected_to mainpage_url(@mainpage)
  end

  test "should destroy mainpage" do
    assert_difference("Mainpage.count", -1) do
      delete mainpage_url(@mainpage)
    end

    assert_redirected_to mainpages_url
  end
end
