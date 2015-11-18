class MoviesController < ApplicationController

	#add_breadcrumb "Home", :root_path

	def index
		#add_breadcrumb "All Movies", :movies_path
		if params[:args].nil?
			@movies = Movie.all
		else
			args = params[:args]
			if args == 'title'
				@movies = Movie.order("title")
			elsif args == 'rating'
				@movies = Movie.order("rating")
			elsif args == 'release_date'
				@movies = Movie.order("release_date")
			else
				@movies = Movie.all
			end
		end
	end

	def show
		@movie = Movie.find_by_id(params[:id]) # what if this movie not in DB?
		# BUG: we should check @movie for validity here!
		
		if @movie.nil?
			flash[:warning] = "Movie id not found."
			redirect_to movies_path and return
		end

		#add_breadcrumb "#{@movie.title}", :movie_path
	end

	def new
		# default: render 'new' template
		#add_breadcrumb "New Movie", :new_movie_path
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(params[:movie])
		if @movie.save
			flash[:notice] = "#{@movie.title} was successfully create."
			# redirect_to movies_path
			# for Project 4.3
			redirect_to movie_path(@movie)
		else
			render 'new' # note, 'new' template can access @movie's field values!
		end
	end

	def edit
		@movie = Movie.find params[:id]
	end

	def update
		@movie = Movie.find params[:id]
		if @movie.update_attributes(params[:movie])
			flash[:notice] = "#{@movie.title} was successfully updated."
			respond_to do |client_wants|
				client_wants.html {redirect_to movie_path(@movie)} # as before
				client_wants.xml {render :xml => @movie.to_xml}
			end
		else
			render 'edit' # note, 'edit' template can access @movie's field values!
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end
end
