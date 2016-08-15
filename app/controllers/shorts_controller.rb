class ShortsController < ApplicationController
  before_action :set_short, only: [:show]

  def show
    @short = Short.find(params[:id].to_i(36)) #decode from base 36 to just show active record int

    # redirect to long url from db
    respond_to do |format|
      format.html { redirect_to @short.long} 
    end  
  end

  # GET /shorts/new
  def new
    @long = Short.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /shorts
  # POST /shorts.json
   
  def create
    @long = Short.new(params[:short]) #params short taken from the form
    ss= @long.long
    @short = ss << "/1"
    @long.short=@short
    @long.save

    respond_to do |format|
      if @long.save
        format.html { render :show, notice: 'Short was successfully created.' }
        format.json { render :show, status: :created, location: @short }
      else
        format.html { render action: "new" }
        format.json { render json: @long.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_short
      @short = Short.find(params[:id].to_i(36))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_params
      params.require(:long)
    end
end
