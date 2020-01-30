class ChangeTypeTribeMembersColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :tribe_members, :name, :string
    change_column :tribe_members, :surname, :string
  end
end
