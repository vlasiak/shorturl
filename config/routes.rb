Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'links#new'
  resources :links, only: [:new, :create]

  get '/:hash', to: 'redirects#process', constraints: { hash: /\w+/ }, as: :process_redirect
end
