class ImportFullDatabase5 < ActiveRecord::Migration
  def up
    counter = 0
    puts "* importing core2"
    fields = 'bn,fpe,program1code,program1percentage,program1descreng,program1descrfre,program2code,program2percentage,program2descreng,program2descrfre,program3code,program3percentage,program3descreng,program3descrfre,f1510,f1510bn,f1510name,f1570,f1600,f1800,f2000,f2100,f2400,f5030,f2500,f2510,f2530,f2540,f2550,f2560,f2570,f2575,f2580,f2590,f2600,f2610,f2620,f2630,f2640,f2650,f2660,f2700,f5450,f5460,f2730,f2740,f2750,f2760,f2770,f2780,f2790,f2800,f3200,f3400,f3900,f4000,f5800,f5810,f5820'.split(',')
    CSV.foreach('db/core2.csv', {:encoding=>'windows-1251'}) do |row|
      counter += 1
      (puts "loaded " + counter.to_s) if counter % 1000 == 0
      GeneralInfo.create(Hash[fields.zip(row)])
    end
  end

  def down

  end
end
