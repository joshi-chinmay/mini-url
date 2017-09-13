Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/:mini_url_code", to: 'reference_urls#navigate', controller: 'reference_urls'
  get "/convert/:mini_url_code", to: 'reference_urls#convert', controller: 'reference_urls', defaults: {format: 'json'}

  post :generate, to: 'reference_urls#generate', controller: 'reference_urls', defaults: {format: 'json'}

  root to: 'reference_urls#url'
end
