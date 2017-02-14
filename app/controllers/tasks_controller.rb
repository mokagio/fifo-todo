class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.todos
  end
end
