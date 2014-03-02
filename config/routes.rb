Clapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
  end

  scope :api do
    scope :charity do
      get 'search' => 'api/charity#search', :as => 'api_charity_search'
      get ':bn'    => 'api/charity#show',   :as => 'api_charity_show'
      get 'get_chart' => 'api/charity#chart', :as => 'api_charity_get_chart'
    end
  end

  root 'home#index'
end
