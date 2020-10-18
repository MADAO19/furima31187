require 'test_helper'

class ArticlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articls_index_url
    assert_response :success
  end

  test "should get new" do
    get articls_new_url
    assert_response :success
  end

end
