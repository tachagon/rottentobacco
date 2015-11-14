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

	def edit
		@movie = Movie.find params[:id]
	end

	def update
		@movie = Movie.find params[:id]
		@movie.update_attributes!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully updated."
		respond_to do |client_wants|
			client_wants.html {redirect_to movie_path(@movie)} # as before
			client_wants.xml {render :xml => @movie.to_xml}
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end
end
