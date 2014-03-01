class Donee < ActiveRecord::Base
  def self.search_by_name(name, n, start=nil)
    unless start.nil?
      where{(name =~ "%#{name}%") & (id >= start)}.limit(n+1)
    else
      where{(name =~ "%#{name}%")}.first
    end
  end
end
