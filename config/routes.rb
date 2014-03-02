Clapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
  end

  namespace :api do
  	scope :charity do
  		get 'search' => 'api/charity#search', :as => 'api_charity_search'
  		get ':bn'    => 'api/charity#show',   :as => 'api_charity_show'
  	end
    get 'get_chart' => 'api#get_chart', :as => 'api_get_chart'
  end

  root 'home#index'
end
