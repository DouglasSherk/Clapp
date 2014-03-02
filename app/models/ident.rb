class Ident < ActiveRecord::Base
  def self.search_by_name(name, n, start=nil)
    (unless start.nil?
      where{(legalname =~ "%#{name}%") & (id >= start)}.limit(n+1)
    else
      where{legalname =~ "%#{name}%"}.limit(n+1)
    end).map! do |row|
      if not row.legalname.nil? and /^[A-Z0-9_\/ -]+$/ =~ row.legalname and row.legalname.include? ' '
        row.legalname = row.legalname.titleize
      end
      row
    end
  end
end
