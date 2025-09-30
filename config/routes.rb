Rails.application.routes.draw do
  root "sessions#new"
  
  # Rotas de autenticação
  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  if ENV["ENABLE_TICKETING"] == "true" || Rails.env.development?
    namespace :bilheteria do
      resources :events do
        resources :tickets, except: [:index] do
          member do
            patch :confirm
            patch :cancel
            patch :use
          end
        end
        # /bilheteria/events/:event_id/tickets (index)
        get :tickets, to: "tickets#index"
      end

      # Portaria (tela e POST de venda)
      get  "portaria",      to: "portaria#index"
      post "portaria/sell", to: "portaria#sell", as: :portaria_sell
    end
  end
end
