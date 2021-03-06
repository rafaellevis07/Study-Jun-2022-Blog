class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :post_params, only: [:create, :update]
    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to @post
    end

    def edit
    end

    def update
        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end


    #Private area so it won't be called
    private
    def set_post 
        @post = Post.find(params[:id])
    end

    #It will act agains't  malicious users
    def post_params
        post_params = params.require(:post).permit(:title, :author, :content)
    end
end
