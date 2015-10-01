class CreateMovies < ActiveRecord::Migration
  def up
  	create_table 'movies' do |t|
  		t.string 'title'
	  	t.string 'rating'
	  	t.text 'description'
	  	t.datetime 'release_date'
	  	# Add fields that Rails automatically keep track
	  	# of when movies are added or modified:
	  	t.timestamps
  	end
  end

  def down
  	# delete the whole table and all its date!
  	drop_table 'movies'
  end
end
