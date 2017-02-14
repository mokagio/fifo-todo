class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.todos
  end

  def create
    task = Task.new(task_params)
    unless task.save
      flash[:error] = "Could not create the new task"
    end

    redirect_to '#index'
  end

  private

  def task_params
    params.require(:task).permit(:title, :priority)
  end
end
