class AddContentToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :content, :string
  end
end
