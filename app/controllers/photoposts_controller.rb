class PhotopostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:edit, :update, :destroy]
    #before_action :owned_post, only: [:edit, :update, :destroy]

    def index
        #@posts = Post.all.order('created_at')
        @photoposts = Photopost.where(:user_id => current_user.id)
    end

    def new
        @photopost = current_user.photoposts.build
    end

    def create
        @photopost = current_user.photoposts.build(post_params)
        @photopost.user_id = current_user.id if current_user
        if @photopost.save
            flash[:success] = "The image has been uploaded!"
            redirect_to photoposts_path
        else
            flash.now[:alert] = "The image cannot be uploaded!"
            redirect_to photoposts_path
        end
    end

    def show
      @photopost = Photopost.find(params[:id])
    end


    def edit
    end

    def update
      @photoost = Photopost.find(params[:id])
      if @photopost.update(post_params)
        flash[:notice] = "post was successfully updated"
        redirect_to photopost_url(@post)
        #redirect_to :action => :show, :id => @post
      else
        render :action => :edit
      end
    end

    def destroy  
      @photopost = Photopost.find(params[:id])
      @photopost.destroy
      redirect_to photoposts_path
    end  

    private

    def post_params
        params.require(:photopost).permit(:image, :caption)
    end


    def set_post
        @photopost = Photopost.find(params[:id])
    end


    def owned_post
      unless current_user == @photopost.user
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
      end
    end
end
