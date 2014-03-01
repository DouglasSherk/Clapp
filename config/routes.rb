Clapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
  end

  scope :api do
    get 'search_by_name' => 'api#search_by_name', :as => 'api_search_by_name'
    get 'get_chart'      => 'api#get_chart',      :as => 'api_get_chart'
  end

  root 'home#index'
end
