class StaticPagesController < ApplicationController
  def home
    @post = Post.new
    

    # scope to see all posts from everyone
    @posts = Post.all.order(created_at: :desc).limit(10)
    # scope to see own posts only
    # @posts = current_user.posts.order(created_at: :desc)
    # scope to see network and own posts
    # @posts = current_user.get_network_posts

    @suggested_friends = User.where.not(id: current_user.friends).limit(5)

  end

end
