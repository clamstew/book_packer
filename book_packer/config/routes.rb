BookPacker::Application.routes.draw do
  resources :books
  resources :boxes

  root :to => "books#index"
end
