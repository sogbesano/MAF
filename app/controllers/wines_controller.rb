class WinesController < ApplicationController
  def index
    @wines = Wine.paginate(page: params[:page],
			   per_page: params[:per_page]).order('name')
  end

  def show
   @wine = Wine.find(params[:id])
  end

  def new
    @wine = Wine.new
  end

  def edit
  end

  #POST /wines
  #POSER /wines.json
  def create
    @wine = Wine.new(wine_params)
    respond_to do |format|
    if @wine.save#try to save wine
        format.html { redirect_to(wine_url(@wine, page: @current_page),
                                  notice: 'Wine was successfully created.') }
        format.json { render action: 'show', status: :created, location: @wine }
      else
        format.html { render action: 'new' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

   # No params from the internet, only allow the white list through.
  def wine_params
    params.require(:wine).permit(:name, :shortdesc, :longdesc, :grapetype, :forvegeterians, :origin, :bottlesize, :price, :supplier, :photo)
  end

    private
  def set_wine
    @wine = Wine.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
