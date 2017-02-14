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

  # TODO: refactor skip and complete logic into a single parameteric method
  def skip
    id = params[:id]
    task = Task.find(id)

    if task.nil?
      flash[:error] = "Could not find task with id #{id}"
      redirect_to '#index'
    end

    task.skip_count += 1

    unless task.save!
      flash[:error] = "Could not save task"
    end

    redirect_to '#index'
  end

  def complete
    id = params[:id]
    task = Task.find(id)

    if task.nil?
      flash[:error] = "Could not find task with id #{id}"
      redirect_to '#index'
    end

    task.done = true

    unless task.save!
      flash[:error] = "Could not save task"
    end

    redirect_to '#index'
  end

  private

  def task_params
    params.require(:task).permit(:title, :priority)
  end
end
