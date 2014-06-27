class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :events
      t.string :name
      t.string :promoted_content
      t.string :query
      t.string :url
      t.timestamps
    end
  end
end
