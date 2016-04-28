class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisements.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      flash[:notice] = "Advertisement was saved successfully."
      redirect_to @advertisement
    else
      flash.now[:alert] = "There was an error saving the advertisement. Please try again."
      render :new
    end
  end

  def edit
  end
end
