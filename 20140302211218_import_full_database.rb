class ImportFullDatabase < ActiveRecord::Migration
  def up
    puts "* importing donee2"
    fields = 'bn1,fpe,n,bn2,name,associated,city,province,totalgifts,giftsinkind,designatedgifts'.split(',')
    CSV.foreach('db/donee2.csv', {:encoding=>'windows-1251'}) do |row|
      Donee.create(Hash[fields.zip(row)])
    end

    puts "* importing fin2"
    fields = 'bn, fpe, form, f4020, f4050, f4100, f4110, f4120, f4130, f4140, f4150, f4155, f4160, f4165, f4166, f4170, f4180, f4200, f4250, f4300, f4310, f4320, f4330, f4350, f4400, f4490, f4500, f5610, f4505, f4510, f4530, f4540, f4550, f4560, f4565, f4570, f4575, f4580, f4590, f4600, f4610, f4620, f4630, f4640, f4650, f4655, f4700, f4800, f4810, f4820, f4830, f4840, f4850, f4860, f4870, f4880, f4890, f4891, f4900, f4910, f4920, f4930, f4950, f5000, f5010, f5020, f5030, f5040, f5050, f5100, f5500, f5510, f5750, f5900, f5910'.split(', ')
    CSV.foreach('db/fin2.csv', {:encoding=>'windows-1251'}) do |row|
      Financials.create(Hash[fields.zip(row)])
    end

    puts "* importing sch32"
    fields = 'bn,fpe,f300,f305,f310,f315,f320,f325,f330,f335,f340,f345,f370,f380,f390'.split(',')
    CSV.foreach('db/sch32.csv', {:encoding=>'windows-1251'}) do |row|
      CompensationInfo.create(Hash[fields.zip(row)])
    end

    puts "* importing ident2"
    fields = 'bn,category,designation,legalname,accountname,addressline1,addressline2,city,province,postalcode,country,publiccontactname,phone,email,website'.split(',')
    CSV.foreach('db/ident2.csv', {:encoding=>'windows-1251'}) do |row|
      Ident.create(Hash[fields.zip(row)])
    end

    puts "* importing core2"
    fields = 'bn,fpe,program1code,program1percentage,program1descreng,program1descrfre,program2code,program2percentage,program2descreng,program2descrfre,program3code,program3percentage,program3descreng,program3descrfre,f1510,f1510bn,f1510name,f1570,f1600,f1800,f2000,f2100,f2400,f5030,f2500,f2510,f2530,f2540,f2550,f2560,f2570,f2575,f2580,f2590,f2600,f2610,f2620,f2630,f2640,f2650,f2660,f2700,f5450,f5460,f2730,f2740,f2750,f2760,f2770,f2780,f2790,f2800,f3200,f3400,f3900,f4000,f5800,f5810,f5820'.split(',')
    CSV.foreach('db/core2.csv', {:encoding=>'windows-1251'}) do |row|
      GeneralInfo.create(Hash[fields.zip(row)])
    end

    # Categories are small enough that we're going to skip breaking them up.
  end

  def down

  end
end
