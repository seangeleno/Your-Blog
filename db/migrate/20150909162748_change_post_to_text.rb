class ChangePostToText < ActiveRecord::Migration
  def change
  	change_column :blogs, :post, :text
  end
end
