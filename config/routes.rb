RubyNews::Application.routes.draw do
  get "articles/index"
  get "articles/show"

  #Uploadbox
  mount Uploadbox::Engine => '/uploadbox', as: :uploadbox

  #Devise
  devise_for :users

  #Admin ________________________________________________________

  namespace :admin do
    resources :categories, except: :show
    resources :articles
    resources :users, except: :show
    root 'articles#index'
  end

  #Public ________________________________________________________

  resources :categories, path: '', only: [] do
    resources :articles, path: '', only: [:index, :show]
  end
  root 'home#index'

end
