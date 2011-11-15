Dragmarkers::Application.routes.draw do
  resources :markers
  root to: 'markers#index'
end
