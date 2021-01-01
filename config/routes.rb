Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :clients
    end
  end
  # with this namespaces, in the end, is generated this url: /api/v1/clients/

  # to subdomains
    # constraints subdomain: 'api' do
    #   scope module: 'api' do
    #     namespace :v1 do
    #       resources :clients
    #     end
    #   end
    # end

end
