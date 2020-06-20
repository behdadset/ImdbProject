class CreateFavoritesMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites_movies, :id => false  do |t|
      t.integer :favorite_id
      t.integer :movie_id
    end
  end
end
