class Donee < ActiveRecord::Base
  def self.search_by_name(in_name, in_n, in_start=nil)
    unless in_start.nil?
      where{(name =~ "%#{in_name}%") & (id >= in_start)}.limit(in_n+1)
    else
      where{name =~ "%#{in_name}%"}.limit(in_n+1)
    end
  end
end
