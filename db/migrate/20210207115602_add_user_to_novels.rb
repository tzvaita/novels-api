class AddUserToNovels < ActiveRecord::Migration[6.0]
  def change
    add_reference :novels, :user, null: false, foreign_key: true
  end
end
