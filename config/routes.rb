Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
  	namespace 'v1' do
      resources :offers

      put "offers/change_state/:id", to: "offers#change_state"
    end
  end
end
