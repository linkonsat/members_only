class MainpagesController < ApplicationController
  before_action :set_mainpage, only: %i[ show edit update destroy ]

  # GET /mainpages or /mainpages.json
  def index
    @userposts = User.all
  end

  # GET /mainpages/1 or /mainpages/1.json
  def show
  end

  # GET /mainpages/new
  def new
    @mainpage = Mainpage.new
  end

  # GET /mainpages/1/edit
  def edit
  end

  # POST /mainpages or /mainpages.json
  def create
    @mainpage = Mainpage.new(mainpage_params)

    respond_to do |format|
      if @mainpage.save
        format.html { redirect_to mainpage_url(@mainpage), notice: "Mainpage was successfully created." }
        format.json { render :show, status: :created, location: @mainpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mainpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mainpages/1 or /mainpages/1.json
  def update
    respond_to do |format|
      if @mainpage.update(mainpage_params)
        format.html { redirect_to mainpage_url(@mainpage), notice: "Mainpage was successfully updated." }
        format.json { render :show, status: :ok, location: @mainpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mainpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainpages/1 or /mainpages/1.json
  def destroy
    @mainpage.destroy

    respond_to do |format|
      format.html { redirect_to mainpages_url, notice: "Mainpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mainpage
      @mainpage = Mainpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mainpage_params
      params.fetch(:mainpage, {})
    end
end
