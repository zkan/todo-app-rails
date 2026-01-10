require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todos_index_url
    assert_response :success
  end

  test "renders a todo" do
    todo = Todo.create! title: "Run 10 km"
    get todos_index_url
    assert_match "Run 10 km", @response.body
  end
end
