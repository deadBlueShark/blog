class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      flash[:success] = "New genre was added!"
      redirect_to genres_path
    else
      flash[:danger] = "There's something wrong!"
      render :new
    end
  end

  def show
  end

  private

  def genre_params
    params.require(:genre).permit :name
  end
end
