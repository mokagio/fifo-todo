case Rails.env
when 'development'
  Task.create(title: 'Buy pizza', priority: 3)
  Task.create(title: 'Buy beer', priority: 2)
  Task.create(title: 'Buy coffee beans', priority: 1)
  Task.create(title: 'Learn Haskell', priority: 1, skip_count: 1)
  Task.create(title: 'Work on FIFO-TODO', priority: 1, done: true)
end
