class Donee < ActiveRecord::Base
  def self.search_by_name(name, n, start=nil)
    where('name LIKE ? AND (? is NULL OR id >= ?)', '%'+name+'%', start, start).limit(n+1)
  end
end
