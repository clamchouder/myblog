class PostsTable < TableCloth::Base
  # To include actions on this table, uncomment this line
  include TableCloth::Extensions::Actions

  column :title
  column :created_at
  column :image do |post|
  	image_tag post.image
  end

  actions separator: " | " do
    action {|post| link_to "Edit", edit_post_path(post)}
    action {|post| link_to "Delete", post_path(post), method: :delete}
  end

  config.table.class = 'table table-bordered'

end
