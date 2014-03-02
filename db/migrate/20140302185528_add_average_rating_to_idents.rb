class AddAverageRatingToIdents < ActiveRecord::Migration
  def up
    add_column :idents, :average_rating, :decimal
  end
  def down
    remove_column :idents, :average_rating
  end
end
