class Ident < ActiveRecord::Base
  belongs_to :category
  has_one :financials, :foreign_key => :bn, :primary_key => :bn

  def self.search_by_name(name, n, start=nil)
    unless start.nil?
      where{(legalname =~ "%#{name}%") & (id >= start)}.limit(n+1)
    else
      where{legalname =~ "%#{name}%"}.limit(n+1)
    end
  end
  def display_name
    if /^[A-Z0-9_\/ -]+$/ =~ legalname and legalname.include? ' '
      legalname.titleize
    else
      legalname
    end
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
