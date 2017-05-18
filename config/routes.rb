Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    mount Ckeditor::Engine => "/ckeditor"

    root "pages#show", name_page: "home"
    get "/pages/*page" => "pages#show"

    resources :books do
      resources :reviews, only: [:new, :create]
      resources :ratings, only: [:create, :update, :destroy]
    end

    resources :reviews, except: [:new, :create, :index] do
      resources :comments, only: :create
    end
    resources :users, except: :destroy do
      resources :likes, only: [:create, :destroy]
    end
    resources :comments, except: :index
    resources :relationships, only: [:create, :destroy]
    resources :user_books, only: [:create, :update]
    resources :reports, only: :create
    resources :notifications, only: [:index, :update]
    resources :categories, only: :show
    resources :favorite_books, only: [:create, :destroy]
    resources :requests, except: :show

    namespace :update_notification do
      resource :users, only: :update
    end

    namespace :admin do
      resources :categories do
        resources :books, only: [:new, :create]
      end
      resources :books
      resources :dashboards, only: :index
      resources :reports, only: :index
      resources :users, only: [:index, :destroy]
      resources :requests, except: :show
    end
  end
end
