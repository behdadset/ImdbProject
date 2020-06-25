class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :user_email
      t.text :movie_title

      t.timestamps
    end
  end
end
