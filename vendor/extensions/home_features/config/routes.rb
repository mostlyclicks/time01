Refinery::Core::Engine.routes.draw do

  # Admin routes
  namespace :home_features, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :home_features, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
