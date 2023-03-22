class CommentsController < ApplicationController
  include Pagy::Backend
  def index
  end

  def show
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice]= @comment.errors.full_messages.to_sentence
    end
    redirect_to post_path(params[:post_id])
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(post_id: params[:post_id])
  end
end
