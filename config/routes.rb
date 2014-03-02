Clapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
    get 'categories' => 'home#index', :as => 'categories'
    get 'recommended' => 'home#index', :as => 'recommended'
    get 'settings' => 'home#index', :as => 'settings'
    get 'category/:id' => 'home#index', :as => 'category'
    get 'charity/:bn/financials' => 'home#index', :as => 'charity_financials'
    get 'charity/:bn/description' => 'home#index', :as => 'charity_description'
    get 'charity/:bn/news' => 'home#index', :as => 'charity_news'
  end

  scope :api do
    scope :charity do
      get 'categories'      => 'api/charity#categories',  :as => 'api_charity_categories'
      get 'category/:catid' => 'api/charity#category',    :as => 'api_charity_category'
      get 'search'          => 'api/charity#search',      :as => 'api_charity_search'
      get 'recommended'     => 'api/charity#recommended', :as => 'api_charity_recommended'
      get 'rate'            => 'api/charity#rate',        :as => 'api_charity_rate'
      get ':bn'             => 'api/charity#show',        :as => 'api_charity_show'
    end
  end

  root 'home#index'
end
