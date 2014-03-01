class Donee < ActiveRecord::Base
  def self.search_by_name(in_name, in_n, in_start=nil)
    (unless in_start.nil?
      where{(name =~ "%#{in_name}%") & (id >= in_start)}.order(totalgifts: :desc).limit(in_n+1)
    else
      where{name =~ "%#{in_name}%"}.order(totalgifts: :desc).limit(in_n+1)
    end).map! do |row|
    	row.name = row.name.titleize if /^[A-Z0-9_ -]+$/ =~ row.name and row.name.include? " "
    	row
    end
  end
end
