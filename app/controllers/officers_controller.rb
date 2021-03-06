class OfficersController < ApplicationController
  before_action :set_officer, only: [:show, :edit, :update, :destroy, :promote, :demote]

  # GET /officers
  # GET /officers.json
  def index
    @officers = Officer.all
  end

  # GET /officers/1
  # GET /officers/1.json
  def show
  end

  # GET /officers/new
  def new
    @officer = Officer.new
  end

  # GET /officers/1/edit
  def edit
  end

  # POST /officers
  # POST /officers.json
  def create
    @officer = Officer.new(officer_params)

    respond_to do |format|
      if @officer.save
        format.html { redirect_to @officer, notice: 'Officer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @officer }
      else
        format.html { render action: 'new' }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /officers/1
  # PATCH/PUT /officers/1.json
  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to @officer, notice: 'Officer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officers/1
  # DELETE /officers/1.json
  def destroy
    @officer.destroy
    respond_to do |format|
      format.html { redirect_to officers_url }
      format.json { head :no_content }
    end
  end

  def promote
    @officer.promote!
    flash[:notice] = "#{@officer.name} now has the rank of #{@officer.rank}"
    redirect_to :back
  end

  def demote
    @officer.demote!
    flash[:notice] = "#{@officer.name} now has the rank of #{@officer.rank}"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_officer
      @officer = Officer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def officer_params
      params.require(:officer).permit(:rank, :name, :section_id)
    end
end
