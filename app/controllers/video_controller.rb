class VideoController < ApplicationController

	def index
  		@videos = Video.all
	end

   def new
   		@video = Video.new
   end

   def create
   	puts params["video"]
   	puts "Create"
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


 def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Update' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Destroy!' }
      format.json { head :no_content }
    end
  end


end

