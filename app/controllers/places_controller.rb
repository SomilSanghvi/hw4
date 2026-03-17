class PlacesController < ApplicationController

  def index
    if @current_user != nil
      @places = Place.all
    else
      redirect_to "/login"
    end
  end

  def show
    if @current_user != nil
      @place = Place.find_by({ "id" => params["id"] })
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
    else
      redirect_to "/login"
    end
  end

  def new
    if @current_user != nil
      else
      redirect_to "/login"
    end
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
