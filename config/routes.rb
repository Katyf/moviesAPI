Rails.application.routes.draw do
  resources :movies, only: [:index, :show, :create, :update] do
    resources :reviews, only: [:index, :create]
  end

  resources :users, defaults: { format: :json }, only: [:create] do
        post 'sign_in', on: :collection
      end

  scope '/admin' do
    resources :reviews, only: [:index, :update, :destroy]
  end

end
