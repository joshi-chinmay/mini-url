Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'reference_urls#home'

  post :generate, to: 'reference_urls#generate', controller: 'reference_urls', format: :json
  get "url/:mini_url_code", to: 'reference_urls#url', controller: 'reference_urls'

end
