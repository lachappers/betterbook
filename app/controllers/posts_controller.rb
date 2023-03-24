class PostsController < ApplicationController
  include Pagy::Backend
  
  before_action :set_post, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def edit
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      respond_to do |format|
        format.html # GET
        format.turbo_stream # POST
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    # scope to see all posts from everyone
    @posts = Post.all.ordered.limit(5)
    # scope to see own posts only
    # @posts = current_user.posts.order(created_at: :desc)
    # scope to see network and own posts
    # @posts = current_user.get_network_posts

    # @pagy, @posts = pagy_countless(Post.all.ordered, items:1)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    # if @post.update(post_params)
    #   respond_to do |format|
    #     format.html {redirect_to post_path}# GET
    #     format.turbo_stream # POST
    #   end
    # else
    #   render :edit, status: :unprocessable_entity
    # end

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
    # respond_to do |format|
    #   format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    #users can see all posts
    # @post = Post.find(params[:id])
    #users can only see their own posts
    @post = current_user.posts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def set_posts
    
  end

end
