require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get graph" do
    get dashboards_graph_url
    assert_response :success
  end

  test "should get stocklist" do
    get dashboards_stocklist_url
    assert_response :success
  end

end
