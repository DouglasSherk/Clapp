Clapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
  end

  scope :api do
    get 'search_by_name' => 'api#search_by_name', :as => 'api_search_by_name'
  end

  root 'home#index'
end
