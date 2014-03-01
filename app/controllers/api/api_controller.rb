class Api::ApiController < ApplicationController
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
