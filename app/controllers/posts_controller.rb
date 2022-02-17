# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = current_user.posts.order("updated_at")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "New post created"
    else
      redirect_to new_post_path, notice: "Error creating a post"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "post Updated successfully"
    else
      redirect_to edit_post_path(@post), notice: "Failed to update post"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "post deleted"
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :user_id)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
