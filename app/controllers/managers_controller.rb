class ManagersController < ApplicationController
  before_action :authenticate_mang!
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  # def members_only
  #   render json: {
  #     data: {
  #       message: "Welcome #{current_manager.email}",
  #       user: current_manager
  #     }
  #   }, status: 200
  # end

  
  # GET /managers
  # GET /managers.json
  def index
    @managers = Mang.all
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
    render :json => @manager, :include => :tutorials
  end

  # GET /managers/new
  def new
    @manager = Mang.new
  end

  # GET /managers/1/edit
  def edit
  end

  # POST /managers
  # POST /managers.json
  def create
    @manager = Mang.new(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Mang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:manager).permit(:name)
    end
end
