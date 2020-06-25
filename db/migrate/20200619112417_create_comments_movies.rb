class CreateFavoritesMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites_movies, :id => false  do |t|
      t.text :user_email
      t.text :movie_title

    end
  end
end
