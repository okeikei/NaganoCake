class Admin::GenresController < ApplicationController
    
  def index
    @genres = Genre.all
  end
  
  def create
    @genres = Genre.new(genre_params)
    @genres.save
    redirect_to admin_genres_path
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end

end

