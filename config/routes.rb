Rails.application.routes.draw do

  resources :feedbacks do
    member do
      delete 'publish'
      delete 'unpublish'
    end
  end
  #delete '/feedbacks/:id/publish', to: 'feedbacks#publish'
  #delete '/feedbacks/:id/unpublish', to: 'feedbacks#unpublish'

  resources :hot_offers

  get "/о-нас", to: "static_pages#show", defaults: { :id => '3' }
  get "/aboutus", to: redirect('о-нас')
  get "/контакты", to: "static_pages#show", defaults: { :id => '4' }
  get "/contactus", to: redirect( '/' + ERB::Util.url_encode("контакты") )
  get "/content", to: redirect('/')
  get "/content/*doesntmatter", to: redirect('/')
  get "/vacancies", to: redirect('/')
  get "/vacancies/*doesntmatter", to: redirect('/')
  get "/resume", to: redirect('/')
  get "/resume/*doesntmatter", to: redirect('/')
  get "/articles", to: redirect('/')
  get "/articles/*doesntmatter", to: redirect('/')
  get "/employees", to: redirect('/')
  get "/employees/*doesntmatter", to: redirect('/')
  get "/node", to: redirect('/')
  get "/node/*doesntmatter", to: redirect('/')
  get "/viewkursi", to: redirect('/')
  get "/viewkursi/*doesntmatter", to: redirect('/')
  get "/obuchenie", to: redirect( '/' + ERB::Util.url_encode("о-нас") )
  get "/trudoustroystvo", to: redirect('/')
  get "/collective", to: redirect( '/' + ERB::Util.url_encode("о-нас") )
  get "/collective/*doesntmatter", to: redirect( '/' + ERB::Util.url_encode("о-нас") )
  get "/corporate-services", to: redirect( '/' + ERB::Util.url_encode("о-нас") )
  get "/user", to: redirect('/')

  #get '/signups', to: 'signups#create'
  resources :signups, only:['new', 'create', 'index']

  resource 'control', controller: 'control_panel', only: ['root', 'list'] do
    get '' => 'control_panel#root', as: 'root'
    get 'list' => 'control_panel#list', as: 'list'
  end

  get '/courses', to: 'courses#search'

  resources :courses, except: ['index']

  get '/news/rss' => 'news#feed', format: 'rss'
  resources :news

  resources :static_pages, except: ['index']

  mount Ckeditor::Engine => '/ckeditor'

  root 'homepage_controller#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
