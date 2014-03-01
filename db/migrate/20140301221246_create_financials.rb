require 'csv'

class CreateFinancials < ActiveRecord::Migration
  def up
    create_table :financials do |t|
      t.string :bn
      t.string :fpe
      t.string :form
      t.string :f4020
      t.string :f4050
      t.decimal :f4100, :precision => 14, :scale => 2
      t.decimal :f4110, :precision => 14, :scale => 2
      t.decimal :f4120, :precision => 14, :scale => 2
      t.decimal :f4130, :precision => 14, :scale => 2
      t.decimal :f4140, :precision => 14, :scale => 2
      t.decimal :f4150, :precision => 14, :scale => 2
      t.decimal :f4155, :precision => 14, :scale => 2
      t.decimal :f4160, :precision => 14, :scale => 2
      t.decimal :f4165, :precision => 14, :scale => 2
      t.decimal :f4166, :precision => 14, :scale => 2
      t.decimal :f4170, :precision => 14, :scale => 2
      t.decimal :f4180, :precision => 14, :scale => 2
      t.decimal :f4200, :precision => 14, :scale => 2
      t.decimal :f4250, :precision => 14, :scale => 2
      t.decimal :f4300, :precision => 14, :scale => 2
      t.decimal :f4310, :precision => 14, :scale => 2
      t.decimal :f4320, :precision => 14, :scale => 2
      t.decimal :f4330, :precision => 14, :scale => 2
      t.decimal :f4350, :precision => 14, :scale => 2
      t.string :f4400
      t.string :f4490
      t.decimal :f4500, :precision => 14, :scale => 2
      t.decimal :f5610, :precision => 14, :scale => 2
      t.decimal :f4505, :precision => 14, :scale => 2
      t.decimal :f4510, :precision => 14, :scale => 2
      t.decimal :f4530, :precision => 14, :scale => 2
      t.decimal :f4540, :precision => 14, :scale => 2
      t.decimal :f4550, :precision => 14, :scale => 2
      t.decimal :f4560, :precision => 14, :scale => 2
      t.string :f4565
      t.decimal :f4570, :precision => 14, :scale => 2
      t.decimal :f4575, :precision => 14, :scale => 2
      t.decimal :f4580, :precision => 14, :scale => 2
      t.decimal :f4590, :precision => 14, :scale => 2
      t.decimal :f4600, :precision => 14, :scale => 2
      t.decimal :f4610, :precision => 14, :scale => 2
      t.decimal :f4620, :precision => 14, :scale => 2
      t.decimal :f4630, :precision => 14, :scale => 2
      t.decimal :f4640, :precision => 14, :scale => 2
      t.decimal :f4650, :precision => 14, :scale => 2
      t.string :f4655
      t.decimal :f4700, :precision => 14, :scale => 2
      t.decimal :f4800, :precision => 14, :scale => 2
      t.decimal :f4810, :precision => 14, :scale => 2
      t.decimal :f4820, :precision => 14, :scale => 2
      t.decimal :f4830, :precision => 14, :scale => 2
      t.decimal :f4840, :precision => 14, :scale => 2
      t.decimal :f4850, :precision => 14, :scale => 2
      t.decimal :f4860, :precision => 14, :scale => 2
      t.decimal :f4870, :precision => 14, :scale => 2
      t.decimal :f4880, :precision => 14, :scale => 2
      t.decimal :f4890, :precision => 14, :scale => 2
      t.decimal :f4891, :precision => 14, :scale => 2
      t.decimal :f4900, :precision => 14, :scale => 2
      t.decimal :f4910, :precision => 14, :scale => 2
      t.decimal :f4920, :precision => 14, :scale => 2
      t.string :f4930
      t.decimal :f4950, :precision => 14, :scale => 2
      t.decimal :f5000, :precision => 14, :scale => 2
      t.decimal :f5010, :precision => 14, :scale => 2
      t.decimal :f5020, :precision => 14, :scale => 2
      t.decimal :f5030, :precision => 14, :scale => 2
      t.decimal :f5040, :precision => 14, :scale => 2
      t.decimal :f5050, :precision => 14, :scale => 2
      t.decimal :f5100, :precision => 14, :scale => 2
      t.decimal :f5500, :precision => 14, :scale => 2
      t.decimal :f5510, :precision => 14, :scale => 2
      t.decimal :f5750, :precision => 14, :scale => 2
      t.decimal :f5900, :precision => 14, :scale => 2
      t.decimal :f5910, :precision => 14, :scale => 2
    end
    fields = 'bn, fpe, form, f4020, f4050, f4100, f4110, f4120, f4130, f4140, f4150, f4155, f4160, f4165, f4166, f4170, f4180, f4200, f4250, f4300, f4310, f4320, f4330, f4350, f4400, f4490, f4500, f5610, f4505, f4510, f4530, f4540, f4550, f4560, f4565, f4570, f4575, f4580, f4590, f4600, f4610, f4620, f4630, f4640, f4650, f4655, f4700, f4800, f4810, f4820, f4830, f4840, f4850, f4860, f4870, f4880, f4890, f4891, f4900, f4910, f4920, f4930, f4950, f5000, f5010, f5020, f5030, f5040, f5050, f5100, f5500, f5510, f5750, f5900, f5910'.split(', ')
    CSV.foreach('db/fin.csv', {:encoding=>'windows-1251'}) do |row|
      Financials.create(Hash[fields.zip(row)])
    end
  end

  def down
    drop_table :financials
  end
end

# BN  FPE 300 305 310 315 320 325 330 335 340 345 370 380 390