require "digest"
require "base64"
class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

# def show

# end

# def new

# end

# def create

# end


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
    @url= URL.new(long: params[:url][:long])#params short taken from the form
# debugger
    #run check if url exists already or should this already be done

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

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = URL.find(params[:id].to_i(36))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:long)
    end
end
