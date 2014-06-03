class UpdateProgressTable < ActiveRecord::Migration
  def up
    remove_column :progresses, :caller
  end

  def down
    add_column :progresses, :caller, :string
  end
end
