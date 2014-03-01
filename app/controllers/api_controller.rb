class ApiController < ApplicationController
  def search_by_name
    start = params[:start]
    n     = params[:count] || 5
    res   = Donee.search_by_name(params[:name], n, start)
    msg   = { :status => :ok, :results => res[0,n], :next => res[n] ? res[n]["id"] : nil }
    render :json => msg
  end

  def get_chart
    input = JSON.parse params[:data]
    data  = input['values']
    labels = input['labels']

    chart  = GChart.pie :data   => data,
                        :legend => labels

    msg = { :chart_url => chart.to_url }
    render :json => msg
  end
end
