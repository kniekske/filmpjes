class VideoController < ApplicationController

	def index
  		@videos = Video.all
	end

   def new
   		@video = Video.new
   end

   def create

   	puts params["video"]

   	puts "Videos Create"
   	@video = Video.new

   	@video.title = params["video"]["title"]
   	@video.link = params["video"]["link"]


   	if @videos.save
   			redirect_to video_path(@videos)
   		else
   			render :action => :create
   		end
   	puts @videos
	end


end

