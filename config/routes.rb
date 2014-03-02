Clapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
    get 'causes' => 'home#index', :as => 'causes'
    get 'recommended' => 'home#index', :as => 'recommended'
    get 'settings' => 'home#index', :as => 'settings'
    get 'charity/:bn/financials' => 'home#index', :as => 'charity_financials'
    get 'charity/:bn/description' => 'home#index', :as => 'charity_description'
    get 'charity/:bn/news' => 'home#index', :as => 'charity_news'
  end

  scope :api do
    scope :charity do
      get 'search' => 'api/charity#search', :as => 'api_charity_search'
      get ':bn'    => 'api/charity#show',   :as => 'api_charity_show'
    end
  end

  root 'home#index'
end
