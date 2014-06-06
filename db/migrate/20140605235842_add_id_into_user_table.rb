class AddIdIntoUserTable < ActiveRecord::Migration
  def up
    add_column :users, :twitter_id, :integer, unique: true
  end

  def down
    remove_column :users, :twitter_id
  end
end
