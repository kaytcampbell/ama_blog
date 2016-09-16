class AddPopularPostToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :popular_post, :boolean
  end
end
