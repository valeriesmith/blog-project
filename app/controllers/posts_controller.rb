class PostsController < ApplicationController

	# index show new edit create update destroy
	
	def index 
		@posts = Post.all.order('created_at DESC')
	end 

	def show
    	@post = Post.find(params[:id])
 	end

	def new
		@post = Post.new
	end

	def create
	    @post = Post.new(post_params)
	 
	    if @post.save
    		redirect_to @post
  		else
    		render 'new'
    		p @post.errors
    		p @post.errors.full_messages
  		end
  	end

    private
 
	def post_params
		params.require(:post).permit(:title, :body)
	end


end
