class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index]
  
  def index

    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    
    @post = Post.new(post_params)
    @post.creator = current_user
    
    if @post.save
      flash[:notice] = "Your post was created"
      redirect_to posts_path
    else
      render :new
    end


  end

  def edit
      if @post.creator != current_user
        flash[:error] = "You cannot edit this post"
        redirect_to posts_path
      end
  end


  def update
  
    
    if @post.update(post_params)
      flash[:notice] = "Your post was updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def vote


    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
    
    
    if @vote.valid?
      flash[:notice] = "Thank you for voting"
  
    else

      flash[:error] = "You have already voted for this Post"
    end

    redirect_to :back


  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
