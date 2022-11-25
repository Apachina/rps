Rails.application.routes.draw do
  root "games#index"

  namespace :api do
    scope :curb do
      get '/', to: 'curb#show'
    end
  end
end
