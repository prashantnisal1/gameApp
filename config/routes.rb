Rails.application.routes.draw do
  
 

  root "games#welcome"
  resources :users
  resources :games do
    collection do
      get 'setup'
      get 'play'
      get 'hit'
      get 'stand'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
