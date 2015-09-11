class ChangeShitSoGood < ActiveRecord::Migration
  def change
  	rename_column :blogs , :author , :writer 
  end
end
