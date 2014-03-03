require 'csv'

class ImportFullDatabase3 < ActiveRecord::Migration
  def up
    counter = 0
    puts "* importing sch32"
    fields = 'bn,fpe,f300,f305,f310,f315,f320,f325,f330,f335,f340,f345,f370,f380,f390'.split(',')
    CSV.foreach('db/sch32.csv', {:encoding=>'windows-1251'}) do |row|
      counter += 1
      (puts "loaded " + counter.to_s) if counter % 1000 == 0
      CompensationInfo.create(Hash[fields.zip(row)])
    end
  end

  def down

  end
end
