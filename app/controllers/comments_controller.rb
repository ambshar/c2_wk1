class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :update]
  before_action :set_comment, only: [:edit, :update, :vote]
  
  before_action :require_user


  def create
    
    @comment = @post.comments.build(comment_params)
    @comment.user_id = session[:user_id]
    
    
    if @comment.save
      flash[:notice]= "Your comment was added"

      redirect_to post_path(@post)
    else
      
      render 'posts/show'
    end


  end

  def edit
      
    
      @post = @comment.post
      if @comment.creator != current_user
         flash[:error] = "You cannot edit this comment"
          redirect_to posts_path
      end

  end

  def update
    
    
    if @comment.update(comment_params)
       
      flash[:notice]= "Your comment was updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end

  end

  def vote
    
    
    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = "Thank you for voting"

        else
          flash[:error] = "You have voted for this Comment"
        end
        redirect_to :back
      end
      format.js
    end    
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def set_post
    @post = Post.find_by(slug: params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
    
  end
end