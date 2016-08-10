class ShortsController < ApplicationController
  before_action :set_short, only: [:show, :edit, :update, :destroy]

  # GET /shorts
  # GET /shorts.json
  #def index
  #  @shorts = Short.all
  #end

  # GET /shorts/1
  # GET /shorts/1.json
  def show
    @short = Short.find(params[:id].to_i(36)) #decode from base 36 to just show active record int

    # redirect to long url from db
    respond_to do |format|
      format.html { redirect_to @short.long} 
    end  
  end

  # GET /shorts/new
  def new
    @short = Short.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /shorts
  # POST /shorts.json
  def create
    @short = Short.new(params[:short]) #params short taken from the form

    respond_to do |format|
      if @short.save
        format.html { redirect_to @short, notice: 'Short was successfully created.' }
        format.json { render :show, status: :created, location: @short }
      else
        format.html { render action: "new" }
        format.json { render json: @short.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorts/1
  # PATCH/PUT /shorts/1.json
  #def update
  #  respond_to do |format|
  #    if @short.update(short_params)
  #      format.html { redirect_to @short, notice: 'Short was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @short }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @short.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /shorts/1
  # DELETE /shorts/1.json
  #def destroy
  #  @short.destroy
  #  respond_to do |format|
  #    format.html { redirect_to shorts_url, notice: 'Short was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_short
      @short = Short.find(params[:id].to_i(36))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_params
      params.require(:short).permit(:long)
    end
end