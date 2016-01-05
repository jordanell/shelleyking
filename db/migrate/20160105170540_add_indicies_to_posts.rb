class AddIndiciesToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :featured
    add_index :posts, :visible
    add_index :posts, :slug, unique: true
  end
end
