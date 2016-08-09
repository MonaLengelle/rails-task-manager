class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find(params[:id])

  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    # no need for app/views/movies/destroy.html.erb
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :genre, :watched)
  end

end
