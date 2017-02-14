Rails.application.routes.draw do
  resources :tasks, path: 'task'
  get '/', to: 'tasks#index'
end
