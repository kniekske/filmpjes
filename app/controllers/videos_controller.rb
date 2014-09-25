class VideosController < ApplicationController

	def index
  		@videos = Video.all
	end

   def new
   		@video = Video.new
   end

#   def create
#   	puts params["video"]
#   	puts "Create"
#   	@video = Video.new
#   	@video.title = params["video"]["title"]
#  	@video.link = params["video"]["link"]

#   	if @videos.save
#   			redirect_to video_path(@videos)
#   		else
#   			render :action => :create
#   		end
#   	puts @videos
#end

def show
	@video = Video.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  def create
    @video = Video.new(video_params)
    @video.save
    	redirect_to @video
  end


  def edit
  	@video = Video.find(params[:id])
  end
 def update
 	@video = Video.find(params[:id])
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

  def delete
  	@video = Video.find(params[:id])
    @video.delete
 	redirect_to @video
    end


    def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to @video
    end



  private
  def video_params
  	 params.require(:video).permit(:title, :link)
  end
end

