Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "jobs#index"

  get 'jobs', to:'jobs#index'
  get 'jobs/new', to: 'jobs#new'
  get 'jobs/:id/edit', to: 'jobs#edit'
  get 'jobs/:id', to: 'jobs#show', as: 'job'

  # get '*unmatched_route', to: 'jobs#show'

end
