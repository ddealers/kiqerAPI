class KiqsController < ApplicationController
  # GET /kiqs
  # GET /kiqs.json
  def index
    @kiqs = Kiq.all

    render json: @kiqs
  end

  # GET /kiqs/1
  # GET /kiqs/1.json
  def show
    @kiq = Kiq.find(params[:id])

    render json: @kiq
  end

  # POST /kiqs
  # POST /kiqs.json
  def create
    @kiq = Kiq.new(kiq_params)

    if @kiq.save
      render json: @kiq, status: :created, location: @kiq
    else
      render json: @kiq.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kiqs/1
  # PATCH/PUT /kiqs/1.json
  def update
    @kiq = Kiq.find(params[:id])

    if @kiq.update(kiq_params)
      head :no_content
    else
      render json: @kiq.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kiqs/1
  # DELETE /kiqs/1.json
  def destroy
    @kiq = Kiq.find(params[:id])
    @kiq.destroy

    head :no_content
  end

  private
    
    def kiq_params
      params.require(:kiq).permit(:follow, :follower)
    end
end
