class Category < ActiveRecord::Base
  has_many :idents, :foreign_key => :category, :primary_key => :catid

  def number_of_charities
    idents.count()
  end
  def total_revenue
    idents.joins(:financials).sum(:f4700)
  end
end
