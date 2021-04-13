Rails.application.routes.draw do
  root "static#index"
  resource :users
end
