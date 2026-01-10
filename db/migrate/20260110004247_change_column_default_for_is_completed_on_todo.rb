class ChangeColumnDefaultForIsCompletedOnTodo < ActiveRecord::Migration[8.1]
  def change
    change_column_default(:todos, :is_completed, false)
  end
end
