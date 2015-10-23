class AddCommentsCountToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :comments_count, :integer, default: 0
  end
end
