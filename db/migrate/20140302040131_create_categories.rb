require 'csv'

class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
    	t.integer :catid
    	t.string  :catlabel
    end
    fields = 'catlabel,catid'.split(',')
    CSV.foreach('db/categories.csv', {:encoding=>'windows-1251'}) do |row|
      Category.create(Hash[fields.zip(row)])
    end
  end
  
  def down
  	drop_table :categories
  end
end
