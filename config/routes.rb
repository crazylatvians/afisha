Afisha::Application.routes.draw do

  match "/lv", to: redirect("/")
  
  scope "(:locale)", locale: /lv|ru/ do
    devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
    
    resources :users, only: :show
    resources :events

    root to: 'events#index'
  end
  
end
