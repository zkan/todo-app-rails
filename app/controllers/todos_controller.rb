class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream { }
      end
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.create(todo_params)

    redirect_to todos_index_path
  end

  private

    def todo_params
      params.expect(todo: [ :title, :is_completed ])
    end
end
