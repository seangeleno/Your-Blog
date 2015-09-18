class RemoveTitleFromBlog < ActiveRecord::Migration
  def change
    remove_column :blogs , :title
    remove_column :blogs , :post
  end
end
