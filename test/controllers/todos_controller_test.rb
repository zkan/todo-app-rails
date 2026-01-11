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

  test "updates todo and returns turbo stream" do
    todo = Todo.create! title: "Walk in the evening", is_completed: false

    put "/todos/#{todo.id}",
      params: { todo: { is_completed: true } },
      headers: { "Accept" => "text/vnd.turbo-stream.html" }

    assert_response :success
    assert_equal "text/vnd.turbo-stream.html", response.media_type

    todo.reload
    assert todo.is_completed
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "views the new todo form" do
    get new_todo_path

    assert_response :success
    assert_select "h1", "New To-Do"
  end

  test "creates a todo and gets redirected to index" do
    assert_difference("Todo.count", 1) do
      post todos_path, params: {
        todo: { title: "Buy milk" }
      }
    end

    assert_redirected_to todos_index_path
    follow_redirect!
    assert_response :success
  end
end
