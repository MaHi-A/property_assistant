# frozen_string_literal: true

PropertyAssistant::Application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenditures, only: [:create] do
        get :sub_expenditure_dates, to: 'sub_expenditures#sub_expenditure_dates'
        resources :sub_expenditures, only: [:index] do
        end
      end
    end
  end
end
