class Ident < ActiveRecord::Base
  #belongs_to :category, :foreign_key => :category, :primary_key => :catid
  has_one :financials, :foreign_key => :bn, :primary_key => :bn

  def self.search_by_name(name, n, start=nil, cat=nil)
    results = where{legalname =~ "%#{name}%"}.joins(:financials)
    results = results.where{id >= start} unless start.nil?
    results = results.where{category == cat} unless cat.nil?
    results.limit(n+1).order('f4700 DESC')
  end
  def self.search_by_category(in_category, n, start=nil)
    unless start.nil?
      where{(category == in_category) & (id >= start)}.limit(n+1)
    else
      where{category == in_category}.limit(n+1)
    end
  end
  def clean(str)
    str.tr('Йй','éé')
  end
  def display_name
    res = accountname
    if res == res.upcase and res.include? ' '
      res = res.titleize
    end
    clean(res)
  end
  def display_city
    clean(city.titleize)
  end
  def display_website
    (website || '').downcase
  end
=begin
  Designations:
  A : Public Foundation
  B : Private Foundation
  C : Charitable Organization

  Types:
  A : Welfare
  B : Health
  C : Education
  D : Religion
  E : Benefits to the Community & Other
  var catTypeTitle = {" ": "All", "A": "Welfare", "B": "Health", "C": "Education","D": "Religion", "E": "Benefits to the Community & Other"};
=end
end
