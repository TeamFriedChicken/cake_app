class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
  	redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path(genre)
  end

  # def show
  #   @genre = Genre.find(params[:id])
  #   @genres = Genre.where(validity: true)
  #   @items = @genre.items.page(params[:page]).per(9)
  # end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end