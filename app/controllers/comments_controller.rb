class CommentsController < ApplicationController
  include Pagy::Backend
  before_action :set_post
  def index
  end

  def show
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    if @comment.save
      respond_to do |format|
        format.html # GET
        format.turbo_stream # POST
      end
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id)
    # params.require(:comment).permit(:content, :parent_id).merge(post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
