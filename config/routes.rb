Rails.application.routes.draw do
  get 'events/upcoming_events'
  get 'users/user_with_most_tickets'

  resources :users, :event_venues, :events, :tickets

  resources :ticket_types do
    resources :tickets
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
