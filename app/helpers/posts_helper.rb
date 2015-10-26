module PostsHelper
	def render_post_content(post)
		truncate(post.content, length: 50)
	end	
end
