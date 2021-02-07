class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :liker_id
      t.integer :liked

      t.timestamps
    end
  end
end
