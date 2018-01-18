Rails.application.routes.draw do
  get 'welcome/index'
  match 'contact_us', to: 'welcome#contact_us', via: [:post]

  root 'welcome#index'
end
