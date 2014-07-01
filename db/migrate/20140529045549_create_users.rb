class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name 
      t.string  :lang 
      t.string  :screen_name
      t.string  :time_zone 
      t.text    :description
      t.text    :location
      t.integer :twitter_id, unique: true
      t.timestamps
    end
  end
end
