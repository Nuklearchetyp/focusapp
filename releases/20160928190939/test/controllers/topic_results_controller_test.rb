require 'test_helper'

class TopicResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get topic_results_new_url
    assert_response :success
  end

  test "should get show" do
    get topic_results_show_url
    assert_response :success
  end

end
