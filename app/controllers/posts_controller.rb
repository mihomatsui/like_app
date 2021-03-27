class PostsController < ApplicationController
  def index
    @posts = Post.order(:id).includes(:user)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
