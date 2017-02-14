class Task < ApplicationRecord

  def self.todos
    Task.all
      .reject { |t| t.done }
      .sort { |a,b| b.priority <=> a.priority }
      .sort { |a,b| a.skip_count <=> b.skip_count }
  end
end
