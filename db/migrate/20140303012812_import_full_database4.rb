class ImportFullDatabase4 < ActiveRecord::Migration
  def up
    counter = 0
    puts "* importing ident2"
    fields = 'bn,category,designation,legalname,accountname,addressline1,addressline2,city,province,postalcode,country,publiccontactname,phone,email,website'.split(',')
    CSV.foreach('db/ident2.csv', {:encoding=>'windows-1251'}) do |row|
      counter += 1
      (puts "loaded " + counter.to_s) if counter % 1000 == 0
      Ident.create(Hash[fields.zip(row)])
    end
  end

  def down

  end
end
