class TasksController < ApplicationController
  def index
    @tasks = Task.todos
  end
end
