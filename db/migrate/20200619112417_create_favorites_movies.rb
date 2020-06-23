class CreateFavoritesMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites_movies, :id => false  do |t|
      t.text :user_email
      t.text :title
      t.boolean :fav

    end
  end
end
