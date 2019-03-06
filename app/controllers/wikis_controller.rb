class WikisController < ApplicationController
  before_action  :set_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = Wiki.all
    @user = current_user
  end

  def new
    @wiki = Wiki.new

  end

  def create
    @user = current_user
    @wiki = Wiki.new

    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body]



  #   if @wiki.save
  #     flash[:notice] = "Wiki was saved."
  #     redirect_to @wiki
  #
  #   else
  #     flash.now[:alert] = "There was an error saving the wiki. Please try again."
  #     render :new
  #   end
  # end

  if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error saving your wiki, please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def show
    @wiki = Wiki.find(params[:id])
  end



end
