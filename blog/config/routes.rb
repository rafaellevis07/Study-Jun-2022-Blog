Rails.application.routes.draw do
  get '/posts', to:'posts#index'
  get 'posts/new', to: 'posts#new', as: 'new_post'
  get '/posts/:id', to: 'posts#show', as: 'post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
