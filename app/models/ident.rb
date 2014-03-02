class Ident < ActiveRecord::Base
  def self.search_by_name(name, n, start=nil)
    (unless start.nil?
      where{(legalname =~ "%#{name}%") & (id >= start)}.limit(n+1)
    else
      where{legalname =~ "%#{name}%"}.limit(n+1)
    end).map! do |row|
      if not row.legalname.nil?
        row.legalname = self.display_name(row.legalname)
      end
      row
    end
  end
  def self.display_name(name)
    if /^[A-Z0-9_\/ -]+$/ =~ name and name.include? ' '
      name.titleize
    else
      name
    end
  end
end
