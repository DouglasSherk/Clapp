class Category < ActiveRecord::Base
  has_many :idents

  def number_of_charities
    Ident.count_by_category(catid)
  end
  def total_revenue
    :error
    #ret = ActiveRecord::Base.connection.execute('
    #  SELECT * FROM idents
    #  LEFT JOIN financials ON financials.bn = idents.bn
    #  WHERE idents.category = ?
    #', catid).first
    #ret.nil? ? nil : ret['f']
    #Ident.where(:category => catid).joins(:financials).where(:bn => :bn).sum('f4700')
  end
end
