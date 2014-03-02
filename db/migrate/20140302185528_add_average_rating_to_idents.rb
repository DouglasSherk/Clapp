class AddAverageRatingToIdents < ActiveRecord::Migration
  def change
    add_column :idents, :average_rating, :decimal
  end
end
