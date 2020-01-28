class AddIndexToAncestorId < ActiveRecord::Migration[6.0]
  def change
    add_index :tribe_members, :ancestor_id
  end
end
