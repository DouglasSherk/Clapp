require 'csv'

class CreateDonees < ActiveRecord::Migration
  def up
    create_table :donees do |t|
      t.string  :bn1
      t.string  :fpe
      t.integer :n
      t.string  :bn2
      t.string  :name
      t.string  :associated
      t.string  :city
      t.string  :province
      t.decimal :totalgifts, :precision => 14, :scale => 2
      t.decimal :giftsinkind, :precision => 14, :scale => 2
      t.decimal :designatedgifts, :precision => 14, :scale => 2
    end
    fields = 'bn1,fpe,n,bn2,name,associated,city,province,totalgifts,giftsinkind,designatedgifts'.split(',')
    CSV.foreach('db/donee.csv', {:encoding=>'windows-1251'}) do |row|
      Donee.create(Hash[fields.zip(row)])
    end
  end

  def down
    drop_table :donees
  end
end
