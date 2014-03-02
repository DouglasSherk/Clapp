require 'csv'

class CreateIdent < ActiveRecord::Migration
  def up
    create_table :idents do |t|
      t.string :bn
      t.integer :category
      t.string :designation
      t.string :legalname
      t.string :accountname
      t.string :addressline1
      t.string :addressline2
      t.string :city
      t.string :province
      t.string :postalcode
      t.string :country
      t.string :publiccontactname
      t.string :phone
      t.string :email
      t.string :website
    end
    fields = 'bn,category,designation,legalname,accountname,addressline1,addressline2,city,province,postalcode,country,publiccontactname,phone,email,website'.split(',')
    CSV.foreach('db/ident.csv', {:encoding=>'windows-1251'}) do |row|
      Ident.create(Hash[fields.zip(row)])
    end
  end

  def down
    drop_table :idents
  end
end