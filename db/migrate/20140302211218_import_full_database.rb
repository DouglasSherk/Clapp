require 'csv'

class ImportFullDatabase < ActiveRecord::Migration
  def up
    counter = 0
    puts "* importing donee2"
    fields = 'bn1,fpe,n,bn2,name,associated,city,province,totalgifts,giftsinkind,designatedgifts'.split(',')
    CSV.foreach('db/donee2.csv', {:encoding=>'windows-1251'}) do |row|
      counter += 1
      (puts "loaded " + counter.to_s) if counter % 1000 == 0
      Donee.create(Hash[fields.zip(row)])
    end
    # Categories are small enough that we're going to skip breaking them up.
  end

  def down

  end
end
