Rails.application.routes.draw do
  resources :vinyls do
    collection { post :import }
  end
end
