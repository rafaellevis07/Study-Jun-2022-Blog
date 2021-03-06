class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, except: [:create]

      # No `new` action because form is provided by PostsController#show
      
  def create
    # Create associated model
    @comment = @post.comments.create(comment_params)
    # It shows the comment in the context of the Post
    redirect_to @post
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to @post
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end


  private
  def comment_params
    params.require(:comment).permit(:author, :content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end