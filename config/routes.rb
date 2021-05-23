Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
  resources :users,  only: [:index, :show, :edit, :update]
  resources :books,  except: [:new]
end
