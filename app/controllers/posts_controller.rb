class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post]) #Veryimportant to save what you're going to use
		if @post.save #first line took the parameters of the post (which we created, and this uses the
			redirect_to @post
		else
			render 'new'#reference for posts to save it)
		end
		#render text: params[:post].inspect no need to render this
	end

	def show
		#find gets it and @post gives us an instance variable to reference, passes
		#all of this to the view
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 

	def index
		@posts = Post.all
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

	
end
