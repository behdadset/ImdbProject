class AddMovieIdToFavoriteMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites_movies, :movie_title
    remove_column :favorites_movies, :user_id
    add_column :favorites_movies, :movie_id, :integer
    add_column :favorites_movies, :favorite_id, :integer
  end
end
