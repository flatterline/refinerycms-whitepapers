Refinery::Core::Engine.routes.append do
  namespace :admin, path: 'refinery' do
    resources :whitepapers, only: [:new, :create]
  end
end
