class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
    	t.string :title
    	t.string :content
    	t.string :author
    end
  end
end
