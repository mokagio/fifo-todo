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
    allowed_parameters = params.require(:task).permit(:title, :priority)

    [
      { keyword: ' h', priority: 3 },
      { keyword: ' m', priority: 2 },
      { keyword: ' l', priority: 1 },
    ].
    # TODO: make performant avoiding having to loop through the whole array
    each do |m|
      next unless allowed_parameters[:title].end_with? m[:keyword]

      allowed_parameters[:title] = allowed_parameters[:title][0...-m[:keyword].length]
      allowed_parameters[:priority] = m[:priority]
    end

    return allowed_parameters
  end
end
