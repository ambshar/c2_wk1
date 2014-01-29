class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    
    if @comment.save
      flash[:notice]= "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end


  end

  def edit
      
      @comment = Comment.find(params[:id])
      @post = @comment.post

  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    
    if @comment.update(comment_params)
       
      flash[:notice]= "Your comment was updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end