class BuyersController < ApplicationController
  load_and_authorize_resource

  # GET /buyers
  # GET /buyers.json
  def index
    @buyers = @buyers.search(params[:search]).page(params[:page])

    #respond_to do |format|
    #    format.json { render json: @buyers }
    #end
  end

  def search
    @buyers = @buyers.search(params[:search]).page(params[:page])

    respond_to do |format|
        format.html { render action: 'index' }
        format.json { render json: @buyers}
    end  
  end  

  # GET /buyers/1
  # GET /buyers/1.json
  def show
  end

  # GET /buyers/new
  def new
  end

  # GET /buyers/1/edit
  def edit
  end

  # POST /buyers
  # POST /buyers.json
  def create
    @buyer = Buyer.new(permitted_params.buyer)

    respond_to do |format|
      if @buyer.save
        format.html { redirect_to @buyer, notice: 'Buyer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @buyer }
      else
        format.html { render action: 'new' }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyers/1
  # PATCH/PUT /buyers/1.json
  def update
    respond_to do |format|
      if @buyer.update(permitted_params.buyer)
        format.html { redirect_to @buyer, notice: 'Buyer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyers/1
  # DELETE /buyers/1.json
  def destroy
    @buyer.destroy
    respond_to do |format|
      format.html { redirect_to buyers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

end
