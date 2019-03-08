class SonomasController < ApplicationController
  before_action :set_sonoma, only: [:show, :edit, :update, :destroy]

  def index
    @sonomas = Sonoma.all
    @user = current_user
  end

  def show
    @user = current_user
    @sonoma = Sonoma.find(params[:id])
  end

  def new
    @sonoma = Sonoma.new
  end

  def edit
    @sonoma = Sonoma.find(params[:id])
    @user_emails = User.all.map(&:email)
  end

  def create
      @sonoma = Sonoma.new(sonoma_params)
      @sonoma.user = current_user

      if @sonoma.save
        flash[:notice] = "Wiki was saved."
        redirect_to sonomas_path

      else
        flash.now[:alert] = "There was an error saving the wiki. Please try again."
        render :new
      end
    end

    def update
      if @sonoma.update_attributes(sonoma_params) #assigns and saves
        flash[:notice] = "Wiki was updated"
        redirect_to sonomas_path
      else
        flash.now[:alert] = "There was an error saving your changes. Please try again."
        render :edit
      end
    end

   def destroy
     if @sonoma.destroy
       flash[:notice] = "deleted successfully."
       redirect_to sonomas_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end

   private

   def set_sonoma
     @sonoma = Sonoma.find(params[:id])
   end

   def sonoma_params
     params.require(:sonoma).permit(:title, :body, :private)
   end
 end
