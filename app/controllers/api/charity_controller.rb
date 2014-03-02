class Api::CharityController < Api::ApiController
  def show
    bn = params[:bn]
    ident = Ident.find_by bn:bn
    if ident.nil?
      return render :json => { :status => :notfound }
    end

    donee = Donee.find_by bn2:bn
    financials = Financials.find_by bn:bn
    compensation = CompensationInfo.find_by bn:bn
    msg = {
        :status => :ok,
        :general => {
          :name    => ident.legalname,
          :email   => ident.email,
          :website => ident.website
        },
        :financial => {
          :total_assets        => financials.f4200,
          :total_liabilities   => financials.f4350,
          :issued_tax_receipts => financials.f4490 == 'Y',
          :total_revenue       => financials.f4700,
          :total_expenditures  => financials.f5100,
          :expenditures => {
            :charitable_programs => financials.f5000,
            :management_or_admin => financials.f5010,
            :fundraising         => financials.f5020,
            :political           => financials.f5030
          },
          :compensation => {
            :total_paid_positions => compensation.f300,
            :top10 => {
              :pay_1_to_39999       => compensation.f305||0,
              :pay_40000_to_79999   => compensation.f310||0,
              :pay_80000_to_119999  => compensation.f315||0,
              :pay_120000_to_159999 => compensation.f320||0,
              :pay_160000_to_199999 => compensation.f325||0,
              :pay_200000_to_249999 => compensation.f330||0,
              :pay_250000_to_299999 => compensation.f335||0,
              :pay_300000_to_349999 => compensation.f340||0,
              :pay_350000_or_more   => compensation.f345||0
            },
            :total_compensation => compensation.f390
          }
        }
    }
    render :json => msg
  end

  def search
    q     = params[:q]
    start = params[:start]
    n     = params[:count] || 5

    res = Ident.search_by_name(q, n, start)
    rows = res[0,n].map do |r|
      { :bn => r.bn, :name => r.legalname }
    end
    msg = { :status => :ok, :results => rows, :next => res[n] ? res[n]["id"] : nil }
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
