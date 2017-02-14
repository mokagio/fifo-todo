class Task < ApplicationRecord

  def self.todos
    Task.all
      .reject { |t| t.done }
      .sort { |a,b| [b.priority, a.skip_count, b.updated_at] <=> [a.priority, b.skip_count, a.updated_at] }
  end
end
