class CreateFavoritesMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites_movies, :id => false  do |t|
      t.integer :user_id
      t.text :movie_title

    end
  end
end
