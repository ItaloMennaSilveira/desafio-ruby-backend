Rails.application.routes.draw do
  root "shops#index"
  get "index", to: "shops#index"
  post "upload-file", to: "shops#upload_file"
end
