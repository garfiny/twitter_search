class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :events
      t.string :name
      t.string :query
      t.string :url
    end
  end
end
