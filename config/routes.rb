Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :web do
    namespace :user do
      resources :notes, only: %[index]
    end
  end
end
