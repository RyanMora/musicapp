class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create
    band = Band.find_by(name: params[:band][:name])
    @album = Album.new(album_params)
    @album.band_id = band.id
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.delete
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :record_type)
  end

end
