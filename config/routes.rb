Rails.application.routes.draw do
  get 'scdls/index'
  resources :schedules
end
