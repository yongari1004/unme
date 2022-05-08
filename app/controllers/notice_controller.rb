
class NoticeController < ApplicationController
	@@correct=Array.new
	@@subject = ["언매","심국","영독","실영","미적","기하","물2","화2","생2",
		"지2","생활","인공","과융","과과연","가정"]
	
	def first
		redirect_to '/login'
	end
	
	def login
		@@correct=[]
		@testacc = Account.all
		@insertid = params[:identification]
		@insertpwd = params[:password]
		@testacc.each do |testacc|
			if (testacc.password == @insertpwd) and (testacc.identification == @insertid)
				@@correct.push(@insertid)
				@@correct.push(@insertpwd)
				redirect_to '/home'			
			end	
		end
	end
	
	def home
		@post = Post.all
		@correct = @@correct
		if @correct == []
			redirect_to '/login'
		end
	end
	
	def index
		@subject = @@subject
		
	end
	
	def create
		post = Post.new
		post.subject = params[:subject]
		post.title = params[:title]
		post.description = params[:description]
		@time = Time.now.to_s
		post.time = @time.slice(0..18)
		post.writer = @@correct[0]
		post.password = @@correct[1]
		post.save
		redirect_to '/home'	
	end
	
	def update
		@subject = @@subject
		@post = Post.find(params[:postId])
	end
	
	def update_action
		@id = params[:id]
		post = Post.find(@id)
		post.title = params[:title]
		post.subject = params[:subject]
		post.description = params[:description]
		@time = Time.now.to_s
		post.time = @time.slice(0..18)
		post.save
		redirect_to '/home'
	end
	
	def read
		@post = Post.find(params[:postId])
	end
	
	def delete
		Post.destroy(params[:postId])
		redirect_to '/home'
	end
	
	
end
