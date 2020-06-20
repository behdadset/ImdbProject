class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :poster
      t.float :rate
      t.string :year

      t.timestamps
    end
  end
end
