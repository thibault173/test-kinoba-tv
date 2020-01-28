class RenameAncestorColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :tribe_members, :ancestor, :ancestor_id
  end
end
