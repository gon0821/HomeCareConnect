require "test_helper"

class MedicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get medications_new_url
    assert_response :success
  end

  test "should get create" do
    get medications_create_url
    assert_response :success
  end
end
