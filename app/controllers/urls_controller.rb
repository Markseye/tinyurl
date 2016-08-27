class UrlsController < ApplicationController

   def show
    @url = URL.find(params[:id].to_i(36)) #decode from base 36 to just show active record int

    # redirect to long url from db
    respond_to do |format|
      format.html { redirect_to @url.long} 
    end  
  end

  # GET /urls/new
  def new
    @url = URL.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /shorts
  # POST /shorts.json

  def create
    @url= URL.find_or_create_by(long: params[:url][:long]) #checking if long has been shortened before

    respond_to do |format|
      if @url.save
        format.html { render :show, notice: 'Short was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render action: "new" }
        format.json { render json: @long.errors, status: :unprocessable_entity }
      end
    end
  end

end
