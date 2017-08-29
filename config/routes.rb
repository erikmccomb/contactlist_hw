Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts do
    resources :notes
  end
  
end