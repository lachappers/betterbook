class StaticPagesController < ApplicationController
  def root
    @post = Post.new

    # scope to see all posts from everyone
    @posts = Post.all.order(created_at: :desc)
    # scope to see own posts only
    # @posts = current_user.posts.order(created_at: :desc)
    # scope to see network and own posts
    # @posts = current_user.get_network_posts
  end
end
