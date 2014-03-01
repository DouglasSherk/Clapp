class ApiController < ApplicationController
  def search_by_name
    start = params[:start]
    n = params[:count] || 5
    res = Donee.search_by_name(params[:name], n, start)
    msg = { :status => :ok, :results => res[0,n], :next => res[n] ? res[n]["id"] : nil }
    render :json => msg
  end
end
