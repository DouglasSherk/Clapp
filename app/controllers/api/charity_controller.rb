require 'net/http'

class Api::CharityController < Api::ApiController
  def categories
    render :json => Category.pluck(:catid,:catlabel)
  end
  def category
    catid = params[:catid].to_i
    start = params[:start]
    n     = (params[:count] || 5).to_i

    res = Ident.search_by_category(catid, n, start)
    rows = res[0,n].map do |r|
      { :bn => r.bn, :name => r.display_name }
    end
    msg = { :status => :ok, :results => rows, :next => res[n] ? res[n]["id"] : nil }
    render :json => msg
  end
  def show
    bn = params[:bn]
    ident = Ident.find_by bn:bn
    if ident.nil?
      return render :json => { :status => :notfound }
    end

    category     = Category.find_by(ident.category)
    donee        = Donee.find_by bn2:bn
    financials   = Financials.find_by bn:bn
    compensation = CompensationInfo.find_by bn:bn
    donations = financials.f4630 / 1000000  #donee.totalgifts
   
    # Financial breakdown chart
    chart_data   = [financials.f5000.to_i, financials.f5010.to_i, financials.f5020.to_i, financials.f5030.to_i, financials.f5040.to_i]
    chart_labels = ["Charitable Programs", "Mngmt./Admin.", "Fundraising", "Political Activity", "Other"]
    chart = GChart.pie :data   => chart_data,
                       :legend => chart_labels
    chart.width  = 425
    chart.height = 200
    chart.entire_background = "f2f2f2"
    
    # News
    name = ident.display_name
    response = Net::HTTP.get_response(URI('http://ajax.googleapis.com/ajax/services/search/news?v=1.0&ned=ca&rsz=5&q=' + URI.escape(name)))
    response_parsed = JSON.parse(response.body)

    news_results = []
    truncated_articles = response_parsed["responseData"]["results"][0..4]
    truncated_articles.each do |item|
      item['title'] = ActionView::Base.full_sanitizer.sanitize(item['title'])
      news_results << item.slice('title', 'url')
    end
    
    msg = {
        :status => :ok,
        :bn => bn,
        :summary   => :willnotimplement,
        :donations => donations,  # in millions of dollars
        :average_compensation => (compensation.f390 - compensation.f380) / compensation.f300,
        :general => {
          :name     => ident.display_name,
          :email    => ident.email,
          :website  => ident.display_website,
        },
        :financial => {
          :total_assets        => financials.f4200,
          :total_liabilities   => financials.f4350,
          :issued_tax_receipts => financials.f4490 == 'Y',
          :total_revenue       => financials.f4700,
          :total_expenditures  => financials.f5100,
          :expenditures => {
            :professional_fees   => financials.f4860,
            :charitable_programs => financials.f5000,
            :management_or_admin => financials.f5010,
            :fundraising         => financials.f5020,
            :political           => financials.f5030
          },
          :compensation => {
            :total_full_time_positions => compensation.f300,
            :total_full_time_compensation => compensation.f390 - compensation.f380,
            :total_part_time_positions => compensation.f370,
            :total_part_time_compensation => compensation.f380,
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
        },
        :chart_url => chart.to_url,
        :category_info => {
          :name          => category.catlabel,
          :size          => category.number_of_charities,
          :total_revenue => category.total_revenue
        },
        :news => news_results
    }
    render :json => msg
  end

  def search
    q     = params[:q]
    start = params[:start]
    n     = (params[:count] || 5).to_i
    category = params[:filter]

    res = Ident.search_by_name(q, n, start, category)
    rows = res[0,n].map do |r|
      { :bn => r.bn, :name => r.display_name, :city => r.display_city }
    end
    msg = { :status => :ok, :results => rows, :next => res[n] ? res[n]["id"] : nil }
    render :json => msg
  end


  def recommended
    start = params[:start]
    n     = (params[:count] || 10).to_i

    unless start.nil?
      res = Financials.where{f4700 <= start}.order(f4700: :desc).limit(n+1)
    else
      res = Financials.all.order(f4700: :desc).limit(n+1)
    end
    rows = res[0,n].map do |r|
      { :bn => r.ident.bn, :name => r.ident.display_name }
    end
    render :json => { :status => :ok, :results => rows, :next => res[n] ? res[n]["f4700"] : nil }
  end
end
