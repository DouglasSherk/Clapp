class ApiController < ApplicationController
  def search_by_name
    msg = { :status => :ok }
    render :json => msg
  end
end
