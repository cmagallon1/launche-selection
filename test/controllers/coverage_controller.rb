class CoverageControllerTest < ActionDispatch::IntegrationTest
  def test_coverage_is_not_displayed_in_other_environment
    get '/coverage'
    assert_response :success
  end
end
