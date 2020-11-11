Rails.application.routes.draw do
  devise_for :users
  root 'shops#index'
  get 'index', to: 'shops#index'
  post 'upload-file', to: 'shops#upload_file'
end
