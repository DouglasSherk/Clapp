require 'csv'

class ImportFullDatabase2 < ActiveRecord::Migration
  def up
    counter = 0
    puts "* importing fin2"
    fields = 'bn, fpe, form, f4020, f4050, f4100, f4110, f4120, f4130, f4140, f4150, f4155, f4160, f4165, f4166, f4170, f4180, f4200, f4250, f4300, f4310, f4320, f4330, f4350, f4400, f4490, f4500, f5610, f4505, f4510, f4530, f4540, f4550, f4560, f4565, f4570, f4575, f4580, f4590, f4600, f4610, f4620, f4630, f4640, f4650, f4655, f4700, f4800, f4810, f4820, f4830, f4840, f4850, f4860, f4870, f4880, f4890, f4891, f4900, f4910, f4920, f4930, f4950, f5000, f5010, f5020, f5030, f5040, f5050, f5100, f5500, f5510, f5750, f5900, f5910'.split(', ')
    CSV.foreach('db/fin2.csv', {:encoding=>'windows-1251'}) do |row|
      counter += 1
      (puts "loaded " + counter.to_s) if counter % 1000 == 0
      Financials.create(Hash[fields.zip(row)])
    end
  end

  def down

  end
end
