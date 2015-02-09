class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5}
  validates :body, presence: true

	def create
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to @post
 	end
 
  private
 
	def post_params
	   params.require(:post).permit(:title, :body)
	end	  

end
