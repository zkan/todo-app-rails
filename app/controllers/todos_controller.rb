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

  private

  def todo_params
    params.expect(todo: [ :is_completed ])
  end
end
