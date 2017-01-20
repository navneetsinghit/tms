Rails.application.routes.draw do
  get 'dashboard/index'
	authenticated :user do
    root :to => "dashboard#index"
  end
	root to: 'landing_page#show'
  devise_for :users, controllers: {
		sessions: 'users/sessions',
		passwords: 'users/passwords',
		registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
