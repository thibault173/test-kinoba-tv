class AddPrimaryKey < ActiveRecord::Migration[6.0]
  def change
    change_column :tribe_members, :id, :primary_key
  end
end
