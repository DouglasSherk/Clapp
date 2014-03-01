require 'csv'

class CreateCompensationInfo < ActiveRecord::Migration
  def up
    create_table :compensation_infos do |t|
      t.string :bn
      t.string :fpe
      t.integer :f300
      t.integer :f305
      t.integer :f310
      t.integer :f315
      t.integer :f320
      t.integer :f325
      t.integer :f330
      t.integer :f335
      t.integer :f340
      t.integer :f345
      t.integer :f370
      t.decimal :f380, :precision => 14, :scale => 2
      t.decimal :f390, :precision => 14, :scale => 2
    end
    fields = 'bn,fpe,f300,f305,f310,f315,f320,f325,f330,f335,f340,f345,f370,f380,f390'.split(',')
    CSV.foreach('db/sch3.csv', {:encoding=>'windows-1251'}) do |row|
      CompensationInfo.create(Hash[fields.zip(row)])
    end
  end

  def down
    drop_table :compensation_infos
  end
end