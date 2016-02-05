class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    cars = Car.all
    @money_left = params[:page][:amount].to_i 
    debugger
    @cars_combination = []
    index = 0
    while @money_left > 0 
      @money_left -= cars[index].amount
      if @money_left > 0
        @cars_combination << cars[index]
      end
      index += 1
      if index == cars.length
        index = 0
      end
    end

    @page = Page.new(page_params)

    render :show

    # respond_to do |format|
    #   if @page.save
    #     format.html { redirect_to @page, notice: 'Page was successfully created.' }
    #     format.json { render :show, status: :created, location: @page }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @page.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:amount)
    end
end
