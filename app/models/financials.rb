class Financials < ActiveRecord::Base
	belongs_to :ident, :foreign_key => :bn, :primary_key => :bn
end
