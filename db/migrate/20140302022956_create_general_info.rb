require 'csv'

class CreateGeneralInfo < ActiveRecord::Migration
  def up
    create_table :general_infos do |t|
      t.string :bn
      t.string :fpe
      t.string :program1code
      t.integer :program1percentage
      t.string :program1descreng
      t.string :program1descrfre
      t.string :program2code
      t.integer :program2percentage
      t.string :program2descreng
      t.string :program2descrfre
      t.string :program3code
      t.integer :program3percentage
      t.string :program3descreng
      t.string :program3descrfre
      t.string :f1510
      t.string :f1510bn
      t.string :f1510name
      t.string :f1570
      t.string :f1600
      t.string :f1800
      t.string :f2000
      t.string :f2100
      t.string :f2400
      t.decimal :f5030, :precision => 14, :scale => 2
      t.string :f2500
      t.string :f2510
      t.string :f2530
      t.string :f2540
      t.string :f2550
      t.string :f2560
      t.string :f2570
      t.string :f2575
      t.string :f2580
      t.string :f2590
      t.string :f2600
      t.string :f2610
      t.string :f2620
      t.string :f2630
      t.string :f2640
      t.string :f2650
      t.string :f2660
      t.string :f2700
      t.decimal :f5450, :precision => 14, :scale => 2
      t.decimal :f5460, :precision => 14, :scale => 2
      t.string :f2730
      t.string :f2740
      t.string :f2750
      t.string :f2760
      t.string :f2770
      t.string :f2780
      t.string :f2790
      t.string :f2800
      t.string :f3200
      t.string :f3400
      t.string :f3900
      t.string :f4000
      t.string :f5800
      t.string :f5810
      t.string :f5820
    end
    fields = 'bn,fpe,program1code,program1percentage,program1descreng,program1descrfre,program2code,program2percentage,program2descreng,program2descrfre,program3code,program3percentage,program3descreng,program3descrfre,f1510,f1510bn,f1510name,f1570,f1600,f1800,f2000,f2100,f2400,f5030,f2500,f2510,f2530,f2540,f2550,f2560,f2570,f2575,f2580,f2590,f2600,f2610,f2620,f2630,f2640,f2650,f2660,f2700,f5450,f5460,f2730,f2740,f2750,f2760,f2770,f2780,f2790,f2800,f3200,f3400,f3900,f4000,f5800,f5810,f5820'.split(',')
    CSV.foreach('db/core.csv', {:encoding=>'windows-1251'}) do |row|
      GeneralInfo.create(Hash[fields.zip(row)])
    end
  end

  def down
    drop_table :general_infos
  end
end
