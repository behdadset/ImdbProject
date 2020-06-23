class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.text :user_email
      t.text :movie_title

      t.timestamps
    end
  end
end
