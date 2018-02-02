class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title,:subtitle, :body, :image))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Your post was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(params.require(:post).permit(:title, :subtitle, :body, :image))
        format.html { redirect_to post_path, notice: 'Post was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Record was successfully deleted.' }
    end
  end
end
