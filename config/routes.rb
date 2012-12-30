Afisha::Application.routes.draw do
  
  match "/", to: redirect("/lv")
  
  scope "(:locale)", locale: /lv|ru/ do
    devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
    resources :users, only: :show

    match "/:locale/:id"  => "events#show"
    resources :events, except: :show

    root to: 'events#index'
  end
  
end
