class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    if @genre = Genre.new(genre_params)
       @genre.save
       redirect_to admin_genres_path
    else
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    if genre = Genre.find(params[:id])
       genre.update(genre_params)
       redirect_to admin_genres_path(genre)
    else
       render 'edit'
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end