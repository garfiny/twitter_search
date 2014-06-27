class RenameTweetsToTrends < ActiveRecord::Migration
  def change
    rename_table :tweets, :trends
  end
end
