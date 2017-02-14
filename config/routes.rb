Rails.application.routes.draw do
  resources :tasks, path: 'task'
  get '/', to: 'tasks#index'
  put '/task/:id/skip', to: 'tasks#skip', as: 'skip'
  put '/task/:id/complete', to: 'tasks#complete', as: 'complete'
end
