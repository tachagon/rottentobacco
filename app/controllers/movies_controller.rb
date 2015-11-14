class MoviesController < ApplicationController

	#add_breadcrumb "Home", :root_path

	def index
		@movies = Movie.all
		#add_breadcrumb "All Movies", :movies_path
	end

	def show
		@movie = Movie.find_by_id(params[:id]) # what if this movie not in DB?
		# BUG: we should check @movie for validity here!
		#add_breadcrumb "#{@movie.title}", :movie_path
	end

	def new
		# default: render 'new' template
		#add_breadcrumb "New Movie", :new_movie_path
	end

	def create
		@movie = Movie.create!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully create."
		redirect_to movies_path
	end
end
