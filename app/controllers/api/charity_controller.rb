class Api::CharityController < Api::ApiController
  def show
    bn = params[:bn]
    donee = Donee.find_by bn2:bn
    financials = Financials.find_by bn:bn
    compensation = CompensationInfo.find_by bn:bn
    msg = {
        :status => :ok,
        :donee => donee,
        :financials => financials,
        :compensation => compensation
    }
    render :json => msg
  end

  def search
    q     = params[:q]
    start = params[:start]
    n     = params[:count] || 5

    res = Donee.search_by_name(q, n, start)
    msg = { :status => :ok, :results => res[0,n], :next => res[n] ? res[n]["id"] : nil }
    render :json => msg
  end

  def chart
    input = JSON.parse params[:data]
    data  = input['values']
    labels = input['labels']

    chart  = GChart.pie :data   => data,
                        :legend => labels

    msg = { :chart_url => chart.to_url }
    render :json => msg
  end
end
