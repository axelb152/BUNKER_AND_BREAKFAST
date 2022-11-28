require "test_helper"

class BunkersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bunkers_index_url
    assert_response :success
  end

  test "should get new" do
    get bunkers_new_url
    assert_response :success
  end

  test "should get show" do
    get bunkers_show_url
    assert_response :success
  end

  test "should get create" do
    get bunkers_create_url
    assert_response :success
  end

  test "should get edit" do
    get bunkers_edit_url
    assert_response :success
  end

  test "should get update" do
    get bunkers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bunkers_destroy_url
    assert_response :success
  end
end
