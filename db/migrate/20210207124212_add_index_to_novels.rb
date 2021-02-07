class AddIndexToNovels < ActiveRecord::Migration[6.0]
  def change
    add_index :novels, [:user_id, :created_at]
  end
end
