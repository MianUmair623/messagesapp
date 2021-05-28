Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root to: "rooms#index"   
  resources :rooms do
  	collection do
  		post :create_room
  	end
  end
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
